import 'package:delalo/delalo_app/repository/admin_repository/order_jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_event.dart';
import 'order_state.dart';


class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository}) : super(OrderLoading());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is OrdersLoad) {
      yield OrderLoading();
      try {
        final orders = await orderRepository.getOrders();
        print("inside orders bloc");
        print(orders);
        yield OrdersLoadSuccess(orders);
      } catch (_) {
        yield OrderOperationFailure();
      }
    }
  }
}