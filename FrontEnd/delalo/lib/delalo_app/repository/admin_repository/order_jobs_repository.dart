

import 'package:delalo/delalo_app/data_provider/admin_data/order_jobs_data.dart';
import 'package:delalo/delalo_app/models/orderDetails.dart';

class OrderRepository {
  final OrderDataProvider orderdataProvider;

  OrderRepository({required this.orderdataProvider});

  Future<List<OrderDetails>> getOrders() async {
    print("Inside order repository");
    return await orderdataProvider.getOrders();
  }

  
}