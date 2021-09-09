import 'dart:convert';
import 'package:delalo/delalo_app/models/models.dart';

import 'package:http/http.dart' as http;

class CategoryDataProvider {
  final _baseUrl = "localhost:3000";
  final http.Client httpClient;

  Uri generateUri(path) {
    return Uri.http(_baseUrl, path);
  }

  CategoryDataProvider({required this.httpClient});

  Future<List<Category>> getCategories() async {
    final response = await httpClient.get(
      generateUri('Category'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      Iterable Categories = jsonDecode(response.body);

      List<Category> mappedCategories = List<Category>.from(
          Categories.map((Category) => Category.fromJson(Category))).toList();

      return mappedCategories;
    } else {
      throw Exception('Failed to load Categories');
    }
  }

  Future<Category> getCategoryById(String category_id) async {
    final response =
        await httpClient.get(Uri(path: '$_baseUrl/Category/${category_id}'));

    if (response.statusCode == 200) {
      final Category = jsonDecode(response.body);
      return Category.fromJson(Category);
    } else {
      throw Exception('Failed to load Category by Id');
    }
  }
}
