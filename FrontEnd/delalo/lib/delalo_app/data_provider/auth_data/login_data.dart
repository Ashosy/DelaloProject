import 'dart:convert';
import 'package:delalo/delalo_app/models/models.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginDataProvider {
  final _baseUrl = "localhost:3000";
  final http.Client httpClient;
  static late SharedPreferences SESSION;

  LoginDataProvider({required this.httpClient}) {
    getSharedPrefernce();
  }

  static Future getSharedPrefernce() async {
    SESSION = await SharedPreferences.getInstance();
  }

  Uri generateUri(path) {
    return Uri.http(_baseUrl, path);
  }

  Future<void> login(Login login) async {
    final response = await httpClient.post(Uri(path: '$_baseUrl/login'),
        headers: <String, String>{
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': login.email,
          'password': login.password
        }));

    if (response.statusCode == 200) {
      var toStore = jsonDecode(response.body);
      await SESSION.setString("email", login.email);
      await SESSION.setString("role", toStore.role);
      await SESSION.setString("token", toStore.token);
      return;
    } else if (response.statusCode == 400) {
      throw LoginFailedException(errorText: response.body);
    } else {
      throw LoginFailedException(
          errorText: "Connection error. Please try again");
    }
  }
}
