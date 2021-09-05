import 'dart:convert';
import 'package:delalo/delalo_app/models/order_jobs.dart';
import 'package:http/http.dart' as http;

class OrderDataProvider {
  final _baseUrl = 'http://localhost:3000';
  late final http.Client httpClient;

  // OrderDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Order> createOrder(Order order) async {
    final response = await httpClient.post(
      Uri.http('localhost:3000', '/order'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'status': order.status,
        'progress': order.progress,
        'is_completed': order.is_completed,
        'order_created_date': order.order_created_date,
        'order_completed_date': order.order_completed_date,
        'start_time': order.start_time,
        'saved_time': order.saved_time,
        'unique_code': order.unique_code,
        'seeker_id': order.seeker_id,
        'provider_id': order.provider_id,
      }),
    );

    if (response.statusCode == 200) {
      return Order.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Order.');
    }
  }

  Future<List<dynamic>> getOrders() async {
    final response = await httpClient.get(Uri(path: '$_baseUrl/order'));

    if (response.statusCode == 200) {
      final Orders = jsonDecode(response.body) as List;
      return Orders.map((order) => Order.fromJson(order)).toList();
    } else {
      throw Exception('Failed to load Orders');
    }
  }

  Future<void> deleteOrder(String id) async {
    final http.Response response = await httpClient.delete(
      Uri(path: '$_baseUrl/order/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete Order.');
    }
  }

  Future<void> updateOrder(Order order) async {
    final http.Response response = await httpClient.put(
      Uri(path: '$_baseUrl/order/${order.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'status': order.status,
        'progress': order.progress,
        'is_completed': order.is_completed,
        'order_created_date': order.order_created_date,
        'order_completed_date': order.order_completed_date,
        'start_time': order.start_time,
        'saved_time': order.saved_time,
        'unique_code': order.unique_code,
        'seeker_id': order.seeker_id,
        'provider_id': order.provider_id,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update Order.');
    }
  }
}
