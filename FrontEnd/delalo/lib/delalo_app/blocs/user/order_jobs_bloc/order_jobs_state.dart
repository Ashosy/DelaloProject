import 'package:delalo/delalo_app/models/models.dart';
import 'package:equatable/equatable.dart';

class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class Loading extends OrderState {}

class JobStatusChanged extends OrderState {
  JobStatusChanged();

  @override
  List<Object> get props => [];
}

class AcceptJobSuccess extends OrderState {
  AcceptJobSuccess();

  @override
  List<Object> get props => [];
}

class AcceptJobFailure extends OrderState {
  AcceptJobFailure();

  @override
  List<Object> get props => [];
}

class DeclineJobSuccess extends OrderState {
  DeclineJobSuccess();

  @override
  List<Object> get props => [];
}

class DeclineJobFailure extends OrderState {
  DeclineJobFailure();

  @override
  List<Object> get props => [];
}

class ActiveJobSuccess extends OrderState {
  final OrderDetails activeJob;
  final int pendingOrdersLength;

  ActiveJobSuccess(this.activeJob, this.pendingOrdersLength);

  @override
  List<Object> get props => [activeJob];
}

class ActiveJobFailure extends OrderState {}

class PendingJobsLoadSuccess extends OrderState {
  final List<dynamic> pendingJobs;

  PendingJobsLoadSuccess([this.pendingJobs = const []]);

  @override
  List<Object> get props => [pendingJobs];
}

class PendingJobsLoadFailure extends OrderState {}

class OrderLoadSuccess extends OrderState {
  final Order order;

  OrderLoadSuccess(this.order);

  @override
  List<Object> get props => [order];
}

class OrdersLoadSuccess extends OrderState {
  final List<dynamic> orders;

  OrdersLoadSuccess([this.orders = const []]);

  @override
  List<Object> get props => [orders];
}

class OrderOperationFailure extends OrderState {}
