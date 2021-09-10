import 'package:delalo/delalo_app/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class OrdersLoad extends OrderEvent {
  const OrdersLoad();

  @override
  List<Object> get props => [];
}

class OrderLoad extends OrderEvent {
  final String seeker_id;
  const OrderLoad(this.seeker_id);

  @override
  List<Object> get props => [];
}

class OrderCreate extends OrderEvent {
  final Order order;

  const OrderCreate(this.order);

  @override
  List<Object> get props => [order];

  @override
  String toString() => 'Order Created {order: $order}';
}

class OrderUpdate extends OrderEvent {
  final Order order;

  const OrderUpdate(this.order);

  @override
  List<Object> get props => [order];

  @override
  String toString() => 'Order Updated {order: $order}';
}

class OrderDelete extends OrderEvent {
  final Order order;

  const OrderDelete(this.order);

  @override
  List<Object> get props => [order];

  @override
  toString() => 'Order Deleted {order: $order}';
}
