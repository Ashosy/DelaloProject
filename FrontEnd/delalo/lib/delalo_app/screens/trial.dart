import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatelessWidget {
  static const routeName = '/listTile';

  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderBloc = BlocProvider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Orders List")),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     final todo = Todo(description: "This is a new todo");
      //     todoBloc.add(AddTodo(todo));
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: Center(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (_, orderState) {
            if (orderState is OrderLoading) {
              return CircularProgressIndicator();
            }

            if (orderState is OrderOperationFailure) {
              return Text("Sorry loading failed");
            }

            if (orderState is OrdersLoadSuccess) {
              final orders = orderState.orders;

              return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (_, idx) {
                  final order = orders[idx];

                  return ListTile(title: Text(order.id));
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
