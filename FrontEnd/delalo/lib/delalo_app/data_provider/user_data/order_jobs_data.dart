import 'dart:convert';
import 'package:delalo/delalo_app/models/models.dart';

import 'package:http/http.dart' as http;

class OrderDataProvider {
  final _baseUrl = "localhost:3000";
  final http.Client httpClient;

  Uri generateUri(path) {
    return Uri.http(_baseUrl, path);
  }

  OrderDataProvider({required this.httpClient});
  Future<Order> createOrder(Order order) async {
    final response = await httpClient.post(
      Uri(path: '$_baseUrl/order'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
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

  Future<List<Order>> getOrders() async {
    final response = await httpClient.get(
      generateUri('order'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      Iterable orders = jsonDecode(response.body);

      List<Order> mappedOrders =
          List<Order>.from(orders.map((order) => Order.fromJson(order)))
              .toList();

      return mappedOrders;
    } else {
      throw Exception('Failed to load Orders');
    }
  }

  Future<Order> getOrderById(String seeker_id) async {
    final response =
        await httpClient.get(Uri(path: '$_baseUrl/order/${seeker_id}'));

    if (response.statusCode == 200) {
      final order = jsonDecode(response.body);
      return Order.fromJson(order);
    } else {
      throw Exception('Failed to load order by Id');
    }
  }

  Future<void> deleteOrder(Order order) async {
    final http.Response response = await httpClient.delete(
      Uri(path: '$_baseUrl/order/${order.id}'),
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
        'progress': order.progress,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update order progress.');
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

  Future<void> updateJobStatus(Order job, User provider) async {
    final http.Response response = await httpClient.put(
      Uri(path: '$_baseUrl/updateStatus', queryParameters: <String, dynamic>{
        'provider_id': provider.id,
        '_id': job.id
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'status': job.status,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update job status.');
    }
  }

  Future<Order> getActiveJob(User provider) async {
    final response =
        await httpClient.get(Uri(path: '$_baseUrl/activeJob/${provider.id}'));

    if (response.statusCode == 200) {
      final job = jsonDecode(response.body);
      return Order.fromJson(job);
    } else {
      throw Exception('Failed to load job by provider Id');
    }
  }

  Future<List<OrderDetails>> getPendingJobs(User provider) async {
    final response =
        await httpClient.get(Uri(path: '$_baseUrl/pendingJobs/${provider.id}'));

    if (response.statusCode == 200) {
      final jobs = jsonDecode(response.body) as List;
      return jobs.map((job) => OrderDetails.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load pending jobs');
    }
  }

  Future<List<OrderDetails>> getDeclinedJobs(User provider) async {
    final response = await httpClient
        .get(Uri(path: '$_baseUrl/declinedJobs/${provider.id}'));

    if (response.statusCode == 200) {
      final jobs = jsonDecode(response.body) as List;
      return jobs.map((job) => OrderDetails.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load declined jobs');
    }
  }

  Future<List<OrderDetails>> getCompletedJobs(User provider) async {
    final response = await httpClient
        .get(Uri(path: '$_baseUrl/completedJobs/${provider.id}'));

    if (response.statusCode == 200) {
      final jobs = jsonDecode(response.body) as List;
      return jobs.map((job) => OrderDetails.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load completed jobs');
    }
  }
}
