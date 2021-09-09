import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/data_provider/data_provider.dart';
import 'package:delalo/delalo_app/repository/repository.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/activeJob.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/pendingJobs.dart';
import 'package:delalo/routeGenerator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowTitle.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowContent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ProviderJob extends StatelessWidget {
  ProviderJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String provider_id = "61332f182eb4f64398fa7676";
    final orderBloc = BlocProvider.of<OrderBloc>(context);
    orderBloc.add(ProviderJobStatus(provider_id));
    return Scaffold(
      body: Center(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (_, orderState) {
            if (orderState is Loading) {
              return CircularProgressIndicator();
            }

            if (orderState is PendingJobsLoadFailure) {
              return Center(child: Text("No Pending Jobs."));
            }

            if (orderState is PendingJobsLoadSuccess) {
              return PendingJobs();
            }

            if (orderState is ActiveJobSuccess) {
              return ActiveJob();
            }

            return Container();
          },
        ),
      ),
    );
  }
}
