import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PendingJobs extends StatefulWidget {
  PendingJobs({Key? key}) : super(key: key);

  @override
  _PendingJobsState createState() => _PendingJobsState();
}

class _PendingJobsState extends State<PendingJobs> {
  @override
  Widget build(BuildContext context) {
    final orderBloc = BlocProvider.of<OrderBloc>(context);

    return Scaffold(
      body: Center(
        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (ctx, orderState) {},
          builder: (_, orderState) {
            if (orderState is Loading) {
              return CircularProgressIndicator();
            }

            if (orderState is PendingJobsLoadSuccess) {
              final pendingJobs = orderState.pendingJobs;

              return ListView.builder(
                itemCount: pendingJobs.length,
                itemBuilder: (context, index) {
                  final job = pendingJobs[index];
                  final userName =
                      job.user!.firstname + " " + job.user!.lastname;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                    title: Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(job.provider!.category),
                        ],
                      ),
                    ),
                    trailing: Container(
                      margin: EdgeInsets.all(0),
                      width: 120,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              orderBloc.add(
                                AcceptJob(job.order.id),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ), // icon
                                Text(
                                  'Accept',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ), // text
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              orderBloc.add(
                                DeclineJob(job.order.id),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ), // icon
                                Text(
                                  'Decline',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ), // text
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
