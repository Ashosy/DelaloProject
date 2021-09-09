import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:delalo/delalo_app/repository/repository.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/activeJob.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository;

  OrderBloc({required this.orderRepository})
      : assert(orderRepository != null),
        super(Loading());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is AcceptJob) {
      yield Loading();
      try {
        final resStatus =
            await orderRepository.updateJobStatus(event.order_id, "active");

        if (resStatus == 201) {
          print("job accepted");
          yield AcceptJobSuccess();
        } else {
          yield AcceptJobFailure();
        }

        // yield ActiveJobSuccess(job);
      } catch (_) {
        yield ActiveJobFailure();
      }
    }
    if (event is DeclineJob) {
      yield Loading();
      try {
        final resStatus =
            await orderRepository.updateJobStatus(event.order_id, "declined");

        if (resStatus == 201) {
          print("job declined");
          yield DeclineJobSuccess();
        } else {
          yield DeclineJobFailure();
        }

        // yield ActiveJobSuccess(job);
      } catch (_) {
        yield ActiveJobFailure();
      }
    }

    if (event is ProviderJobStatus) {
      yield Loading();
      try {
        final activeJob = await orderRepository.getActiveJob(event.provider_id);

        final pendingJobs =
            await orderRepository.getPendingJobs(event.provider_id);

        if (activeJob is OrderDetails) {
          yield ActiveJobSuccess(activeJob, pendingJobs.length);
        } else if (pendingJobs.length > 0 &&
            pendingJobs[0] != "No Pending Jobs") {
          yield PendingJobsLoadSuccess(pendingJobs);
        } else {
          yield PendingJobsLoadFailure();
        }

        // yield ActiveJobSuccess(job);
      } catch (_) {
        yield ActiveJobFailure();
      }
    }

    if (event is OrdersLoad) {
      yield Loading();
      try {
        final orders = await orderRepository.getOrders();

        yield OrdersLoadSuccess(orders);
      } catch (_) {
        yield OrderOperationFailure();
      }
    }
    if (event is OrderLoad) {
      yield Loading();
      try {
        final order = await orderRepository.getOrderById(event.seeker_id);

        yield OrderLoadSuccess(order);
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
