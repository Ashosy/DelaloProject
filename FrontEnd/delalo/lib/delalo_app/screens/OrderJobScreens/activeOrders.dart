import 'package:delalo/routeGenerator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'orderDetails_screen.dart';

class ActiveOrders extends StatelessWidget {
  ActiveOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final orderBloc = BlocProvider.of<OrderBloc>(context);

    return Scaffold(
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
              final activeOrders = orderState.orders;

              return ListView.builder(
                itemCount: activeOrders.length,
                itemBuilder: (context, index) {
                  final order = activeOrders[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text(
                      order.id,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Category Type'),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.grey,
                                size: 16,
                              ),
                              Text('+251911111111'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: Colors.grey,
                                size: 16,
                              ),
                              Text('Sat, August 12, 2021 3:54 A.M'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteGenerator.orderDetailScreenName,
                        arguments: ScreenArguments({"orderId": order.id}),
                      );
                    },
                  );
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
