import 'dart:convert';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupProviderDataProvider {
  final _baseUrl = "10.0.2.2:3000";
  final http.Client httpClient;
  static late SharedPreferences SESSION;

  SignupProviderDataProvider({required this.httpClient}) {
    getSharedPrefernce();
  }

  static Future getSharedPrefernce() async {
    WidgetsFlutterBinding.ensureInitialized();
    SESSION = await SharedPreferences.getInstance();
  }

  Future<void> signupProvider(SignupProvider signup) async {
    final URL = Uri.http(_baseUrl, "/users");
    print(signup.email);
    print(signup.password);
    print(signup.firstname);
    print(signup.lastname);
    print(signup.address);
    print(signup.phone);
    print(signup.image);
    print(signup.role);
    print(URL);

    try {
      final response = await httpClient.post(URL,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'email': signup.email,
            'password': signup.password,
            'firstname': signup.firstname,
            'lastname': signup.lastname,
            'address': signup.address,
            'phone': signup.phone,
            'image': signup.image,
            'role': signup.role
          }));
      if (response.statusCode == 200) {
        var signedUpProvider = UserStore.fromJson(jsonDecode(response.body));

        print(signedUpProvider.role);
        await SESSION.setString("email", signup.email);
        await SESSION.setString('id', signedUpProvider.id);
        await SESSION.setString("role", signedUpProvider.role);
        await SESSION.setString("token", signedUpProvider.token);

        // this is for debugging
        print(SESSION.getString('email'));
        print(SESSION.getString('token'));
        print(SESSION.getString('role'));
        print(SESSION.getString('id'));

        return;
      } else if (response.statusCode == 400) {
        throw SignupProviderFailedException(errorText: response.body);
      } else {
        throw SignupProviderFailedException(
            errorText: "Connection error. Please try again");
      }
    } on TypeError catch (e) {
      throw SignupProviderFailedException(
          errorText: "Can not connect to internet ${e.runtimeType} add ${e}");
    }
  }
}
