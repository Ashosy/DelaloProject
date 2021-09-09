import 'dart:convert';

import 'package:delalo/delalo_app/models/models.dart';
import 'package:delalo/delalo_app/models/order_jobs.dart';
import 'package:http/http.dart' as http;

class OrderDataProvider {
  final _baseUrl = "localhost:3000";
  final http.Client httpClient;

  Uri generateUri(path) {
    return Uri.http(_baseUrl, path);
  }

  OrderDataProvider({required this.httpClient});

  Future<List<Order>> getOrders() async {
    final response = await httpClient.get(
      Uri.parse('http://127.0.0.1:3000/order'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      Iterable orders = jsonDecode(response.body);
      print("Inside orders data");
      // print(orders);
      List<Order> mappedOrders =
          List<Order>.from(orders.map((order) => Order.fromJson(order)))
              .toList();
      print("maped orders");
      print(mappedOrders);
      return mappedOrders;
    } else {
      throw Exception('Failed to load Orders');
    }
  }

  Future<List<OrderDetails>> getAllJobs(User provider) async {
    final response =
        await httpClient.get(Uri(path: '$_baseUrl/allJobs/${provider.id}'));

    if (response.statusCode == 200) {
      final jobs = jsonDecode(response.body) as List;
      return jobs.map((job) => OrderDetails.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load all jobs');
    }
  }
}
