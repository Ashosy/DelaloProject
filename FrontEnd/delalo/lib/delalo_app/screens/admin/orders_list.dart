import 'package:delalo/delalo_app/blocs/admin_bloc/order_bloc/order_bloc.dart';
import 'package:delalo/delalo_app/blocs/admin_bloc/order_bloc/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminOrdersJobs extends StatefulWidget {
  const AdminOrdersJobs({Key? key}) : super(key: key);

  @override
  _AdminOrdersJobsState createState() => _AdminOrdersJobsState();
}

class _AdminOrdersJobsState extends State<AdminOrdersJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<OrderBloc, OrderState>(builder: (_, orderState) {
        if (orderState is OrderLoading) {
          return CircularProgressIndicator();
        } else if (orderState is OrderOperationFailure) {
          return Text("Loading failed");
        } else if (orderState is OrderLoadSuccess) {
          final orders = orderState.orders;
          print(orders);
          return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (_, index) {
                final order = orders[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://picsum.photos/250?image=9'),
                    ),
                    title: Text(order.is_completed),
                    subtitle: Text(order.status),
                  ),
                );
              });
        }
        return Container();
      }),
    ));
  }
}
