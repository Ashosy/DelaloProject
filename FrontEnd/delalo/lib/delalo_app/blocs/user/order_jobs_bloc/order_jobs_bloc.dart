import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository})
      : assert(orderRepository != null),
        super(OrderLoading());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is OrdersLoad) {
      yield OrderLoading();
      try {
        final orders = await orderRepository.getOrders();

        yield OrdersLoadSuccess(orders);
      } catch (_) {
        yield OrderOperationFailure();
      }
    }

    if (event is OrderCreate) {
      try {
        await orderRepository.createOrder(event.order);
        final orders = await orderRepository.getOrders();
        yield OrdersLoadSuccess(orders);
      } catch (_) {
        yield OrderOperationFailure();
      }
    }

    if (event is OrderUpdate) {
      try {
        await orderRepository.updateOrder(event.order);
        final orders = await orderRepository.getOrders();
        yield OrdersLoadSuccess(orders);
      } catch (_) {
        yield OrderOperationFailure();
      }
    }

    if (event is OrderDelete) {
      try {
        await orderRepository.deleteOrder(event.order);
        final orders = await orderRepository.getOrders();
        yield OrdersLoadSuccess(orders);
      } catch (_) {
        yield OrderOperationFailure();
      }
    }
  }
}
