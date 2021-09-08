import 'dart:convert';
import 'package:delalo/delalo_app/models/models.dart';

import 'package:http/http.dart' as http;

class UserOnlyDataProvider {
  final _baseUrl = "localhost:3000";
  final http.Client httpClient;

  UserOnlyDataProvider({required this.httpClient});

  Uri generateUri(path) {
    return Uri.http(_baseUrl, path);
  }

  Future<UserOnly> createUser(UserOnly userOnly) async {
    final response = await httpClient.post(
        Uri(path: '$_baseUrl/UserOnly'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          "firstname": userOnly.firstname,
          "lastname": userOnly.lastname,
          'address': userOnly.address,
          'provider_id': userOnly.email,
          'role': userOnly.role,
          'image': userOnly.image,
          'password': userOnly.password,
          'phone': userOnly.phone,
        }));

    if (response.statusCode == 200) {
      return UserOnly.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create User.');
    }
  }

  Future<List<UserOnly>> getUsers() async {
    final response = await httpClient.get(
      generateUri('UserOnly'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      Iterable Users = jsonDecode(response.body);

      List<UserOnly> mappedUsers = List<UserOnly>.from(
          Users.map((user) => UserOnly.fromJson(user))).toList();

      return mappedUsers;
    } else {
      throw Exception('Failed to load UserOnlys');
    }
  }

  Future<UserOnly> getUserByEmail(String email) async {
    final response =
        await httpClient.get(Uri(path: '$_baseUrl/users/byEmail/${email}'));

    if (response.statusCode == 200) {
      final user = jsonDecode(response.body);
      return UserOnly.fromJson(user);
    } else {
      throw Exception('Failed to load UserOnly by Id');
    }
  }

  Future<void> deleteUser(UserOnly userOnly) async {
    final http.Response response = await httpClient.delete(
      Uri(path: '$_baseUrl/users/${userOnly.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user.');
    }
  }

}
