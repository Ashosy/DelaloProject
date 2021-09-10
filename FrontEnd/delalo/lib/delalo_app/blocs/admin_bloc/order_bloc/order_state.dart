import 'package:equatable/equatable.dart';


class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}
class OrderLoading extends OrderState {}

class OrderLoadSuccess extends OrderState {
  final List<dynamic> orders;

  OrderLoadSuccess([this.orders = const[]]);

  @override
  List<Object> get props => [orders];
}

class OrdersLoadSuccess extends OrderState {
  final List<dynamic> orders;

  OrdersLoadSuccess([this.orders = const []]);

  @override
  List<Object> get props => [orders];
}
class OrderOperationFailure extends OrderState {}
