import 'dart:convert';

import 'package:delalo/delalo_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProviderProfileDataProvider {
  final http.Client httpClient;

  ProviderProfileDataProvider({required this.httpClient});

  Future<User> getProvider(String id) async {
    final URL = Uri.http("10.0.2.2:3000", "/provider/$id");
    final response = await httpClient.get(
      URL,
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      print("it got in here");
      final provider = User.fromJson(jsonDecode(response.body));
      print("provider fetched");
      print(provider);
      return provider;
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<List<Review>> getReviewsOfProvider(String providerId) async {
    final URL = Uri.http("10.0.2.2:3000", "/reviewOfProvider/$providerId");
    final response = await httpClient.get(
      URL,
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final reviews = jsonDecode(response.body) as List;
      return reviews.map((review) => Review.fromJson(review)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
