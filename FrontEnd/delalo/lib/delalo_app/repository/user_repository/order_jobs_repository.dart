import 'package:delalo/delalo_app/data_provider/data_provider.dart';
import 'package:delalo/delalo_app/models/models.dart';

class OrderRepository {
  final OrderDataProvider dataProvider;

  OrderRepository({required this.dataProvider}) : assert(dataProvider != null);

  Future<Order> createOrder(Order order) async {
    return await dataProvider.createOrder(order);
  }

  Future<List<Order>> getOrders() async {
    return await dataProvider.getOrders();
  }

  Future<Order> getOrderById(String seeker_id) async {
    return await dataProvider.getOrderById(seeker_id);
  }

  Future<void> deleteOrder(Order order) async {
    return await dataProvider.deleteOrder(order);
  }

  Future<void> updateOrder(Order order) async {
    return await dataProvider.updateOrder(order);
  }

  Future<List<OrderDetails>> getAllJobs(User provider) async {
    return await dataProvider.getAllJobs(provider);
  }

  Future<void> updateJobStatus(Order order, User provider) async {
    return await dataProvider.updateJobStatus(order, provider);
  }

  Future<Order> getActiveJob(User provider) async {
    return await dataProvider.getActiveJob(provider);
  }

  Future<List<OrderDetails>> getPendingJobs(User provider) async {
    return await dataProvider.getPendingJobs(provider);
  }

  Future<List<OrderDetails>> getDeclinedJobs(User provider) async {
    return await dataProvider.getDeclinedJobs(provider);
  }

  Future<List<OrderDetails>> getCompletedJobs(User provider) async {
    return await dataProvider.getCompletedJobs(provider);
  }
}
