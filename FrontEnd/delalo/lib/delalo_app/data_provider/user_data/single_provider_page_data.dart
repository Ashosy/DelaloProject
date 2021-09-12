import 'dart:convert';

import 'package:delalo/delalo_app/models/models.dart';
import 'package:delalo/delalo_app/models/provider_isHired.dart';
import 'package:http/http.dart' as http;

class ProviderProfileDataProvider {
  final http.Client httpClient;

  ProviderProfileDataProvider({required this.httpClient});

  Future<ProviderIsHired> getProvider(
      String providerId, String seekerId) async {
    final URL = Uri.http("10.0.2.2:3000", "/provider/$providerId");
    final response = await httpClient.get(
      URL,
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final secondResponse = await httpClient.get(
      Uri.http("10.0.2.2:3000", "/order/$providerId/$seekerId"),
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200 && secondResponse.statusCode == 200) {
      late var isHired;
      print("=========================================");
      final provider = User.fromJson(jsonDecode(response.body));

      isHired = jsonDecode(secondResponse.body)['order'] != "" ? true : false;

      return new ProviderIsHired(provider, isHired);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<List<OrderDetails>> getReviewsOfProvider(String providerId) async {
    final URL = Uri.http("10.0.2.2:3000", "/allJobs/$providerId");

    print(URL);
    final response = await httpClient.get(
      URL,
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print("second " + response.statusCode.toString());

    if (response.statusCode == 200) {
      final ordersOfProvider = jsonDecode(response.body) as List;
      print("second this got here....1");
      print(ordersOfProvider);
      return ordersOfProvider.map((orderdetails) {
        print("object");
        return OrderDetails.fromJson(orderdetails);
      }).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
