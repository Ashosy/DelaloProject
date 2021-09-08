import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/data_provider/data_provider.dart';
import 'package:delalo/delalo_app/repository/user_repository/order_jobs_repository.dart';
import 'package:delalo/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  final orderRepository = OrderRepository(
      dataProvider: OrderDataProvider(
    httpClient: http.Client(),
  ));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => OrderBloc(orderRepository: orderRepository)
            ..add(
              OrdersLoad(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.welcomeScreenName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
