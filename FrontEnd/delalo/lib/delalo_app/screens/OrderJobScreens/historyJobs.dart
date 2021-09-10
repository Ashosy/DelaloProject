import 'package:delalo/delalo_app/blocs/user/user_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givestarreviews/givestarreviews.dart';

class HistoryJobs extends StatelessWidget {
  HistoryJobs({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    final String provider_id = "61332f352eb4f64398fa7678";
    final orderBloc = BlocProvider.of<OrderBloc>(context);
    orderBloc.add(CompleteJobsLoad(provider_id));

    return Scaffold(
      body: Center(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (_, orderState) {
            if (orderState is Loading) {
              return CircularProgressIndicator();
            }

            if (orderState is CompletedJobsLoadFailure) {
              return Text("Sorry loading failed");
            }

            if (orderState is CompletedJobsLoadSuccess) {
              final jobs = orderState.completedJobs;

              return ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: ListTile(
                      leading: Column(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                AssetImage('assets/images/user.png'),
                          ),
                          Text(
                            job.order.id,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        '153.06ETB',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('3 hours worked'),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                Text('Addis Ababa'),
                              ],
                            ),
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
                                Text(
                                    'Sat, August 12, 2021 3:54 A.M. -\n Sat, August 13, 2021 3:54 P.M. '),
                              ],
                            ),
                            StarRating(
                              value: 3,
                              onChanged: null,
                            ),
                            Text('He did a good job. Satisfying service!')
                          ],
                        ),
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
