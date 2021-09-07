// import 'dart:convert';
// import 'dart:io';

// import 'package:delalo/delalo_app/models/order_jobs.dart';
// import 'package:http/http.dart' as http;

// class AdminOrderJobsDataProvider {
//   final _baseurl = 'http://127.0.0.1:3000';
//   final http.Client httpClient;

//   AdminOrderJobsDataProvider({required this.httpClient})
//       : assert(httpClient != null);

//   //get orders
//   Future<List<Order>> getOrdersFromOrder() async {
//     try {
//       final response = await httpClient.get(Uri.https(_baseurl, "/order"));

//       if (response.statusCode == 200) {
//         final orders = jsonDecode(response.body) as List;
//         return orders.map((order) => Order.fromjson(order)).toList();
//       } else {
//         throw Exception("Error");
//       }
//     } on SocketException catch (e) {
//       throw e;
//     } on HttpException catch (e) {
//       throw e;
//     }
//   }
// }
