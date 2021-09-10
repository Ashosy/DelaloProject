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
  var color_swap = Colors.grey[200];
  var color_swap_white = Colors.white;
  @override
  Widget build(BuildContext context) {
    final ordersBloc = BlocProvider.of<OrderBloc>(context);
    return Scaffold(body: Center(
      child: BlocBuilder<OrderBloc, OrderState>(builder: (_, orderState) {
        print('orders state $orderState');
        if (orderState is OrderLoading) {
          return CircularProgressIndicator();
        } else if (orderState is OrderOperationFailure) {
          return Text("Loading failed");
        } else if (orderState is OrdersLoadSuccess) {
          final orders = orderState.orders;
          print("orders Ui");
          print(orders.length);
          if (orders.length / 2 == 0) {
            color_swap = Colors.white;
            color_swap_white =  Colors.grey;
          } 
          return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (_, index) {
                final order = orders[index];
                final seeker_user_name =
                    order.user!.firstname + order.user!.lastname;
                final provider_user_name =
                    order.provider!.firstname + order.provider!.lastname;
                return Card(
                    child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        
                        child: Container(
                          color: color_swap,
                          child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 5, 5, 10),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text("Provider:  "),
                                     Text('$provider_user_name'),
                                  ],),
                                  SizedBox(height: 5,),
                                 Row(children: [
                                  Text('Category: '),
                                  Text('${order.provider!.category}'),


                                 ],)
                                  // Text('Address  ${order.user!.adderess}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: color_swap_white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 5, 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                Text("Seeker Name "),

                                Text(" ${seeker_user_name}"),

                                  ],

                                ),
                                 SizedBox(height: 5,),
                                 Row(
                                  children: [
                                Text("Seeker Name "),
                                Text(" ${seeker_user_name}"),

                                  ],
                                  
                                )
                                // Text('Start Time ${order.user!.start_time}'),
                                // Text("Saved Time ${order.user!.saved_time}")
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
                    // ListTile(
                    //   leading: CircleAvatar(
                    //     backgroundImage:
                    //         NetworkImage('https://picsum.photos/250?image=9'),
                    //   ),
                    //   title: Text(seeker_user_name),
                    //   subtitle: Text(order.order!.status),
                    // ),
                    );
              });
        }
        return Container();
      }),
    ));
  }
}
