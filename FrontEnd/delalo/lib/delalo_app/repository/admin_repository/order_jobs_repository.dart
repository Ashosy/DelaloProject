import 'package:delalo/delalo_app/data_provider/user_data/order_jobs_data.dart';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:delalo/delalo_app/models/order_jobs.dart';

class OrderRepository {
  final OrderDataProvider orderdataProvider;

  OrderRepository({required this.orderdataProvider});

  Future<List<Order>> getOrders() async {
    print("Inside order repository");
    return await orderdataProvider.getOrders();
  }

  Future<List<OrderDetails>> getAllJobs(User provider) async {
    return await orderdataProvider.getAllJobs(provider);
  }
}