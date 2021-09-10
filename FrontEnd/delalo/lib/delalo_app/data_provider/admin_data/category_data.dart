import 'dart:convert';
import 'dart:io';

import 'package:delalo/delalo_app/models/category.dart';

import 'package:http/http.dart' as http;

class AdminCategoryDataProvider {
  final _baseurl = 'http://127.0.0.1:3000';
  final http.Client httpClient;

  AdminCategoryDataProvider({required this.httpClient})
      : assert(httpClient != null);

  // creating a category or posting

  Future<Category> createCategory(Category category) async {
    try {
      final response =
          await httpClient.post(Uri.http("127.0.0.1:3000", "/category"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                'image': category.image,
                'numOfProviders': category.numOfProviders,
                'description': category.description
              }));

      if (response.statusCode == 200) {
        return Category.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error");
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    }
  }

  // get categories
  Future<List<Category>> getCategoriesFromCategory() async {
    try {
      final response = await httpClient.get(Uri.https(_baseurl, "/category"));

      if (response.statusCode == 200) {
        final categories = jsonDecode(response.body) as List;
        return categories
            .map((category) => Category.fromJson(category))
            .toList();
      } else {
        throw Exception("Error");
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    }
  }

  Future<void> deleteCategory(String id) async {
    try{
      final http.Response response = await httpClient.delete(
        Uri.https(_baseurl, '/category/:$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response.statusCode != 204) {
      throw Exception("Error deleting Category");
    }
    }on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    }
  }

  Future<void> updateCategory(Category category) async {
    try
    {final http.Response response = await httpClient.put(
      Uri.https(_baseurl, '/category/:${category.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': category.id,
        'image': category.image,
        'numOfProviders': category.numOfProviders,
        'description': category.description
      }),
    );
    if (response.statusCode != 204) {
      throw Exception('Error Updating category');
    }
    }on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    }
  }
}
