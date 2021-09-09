import 'package:delalo/delalo_app/blocs/auth_bloc/login_bloc.dart';
import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/data_provider/auth_data/login_data.dart';
import 'package:delalo/delalo_app/data_provider/data_provider.dart';
import 'package:delalo/delalo_app/repository/auth_repository/login_repository.dart';
import 'package:delalo/delalo_app/repository/user_repository/order_jobs_repository.dart';
import 'package:delalo/delalo_app/screens/navigation_drawer/navigation.dart';
import 'package:delalo/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  static final httpClient = http.Client();
  final orderRepository = OrderRepository(
      dataProvider: OrderDataProvider(
    httpClient: httpClient,
  ));

  final loginRepository =
      LoginRepository(dataProvider: LoginDataProvider(httpClient: httpClient));

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
        BlocProvider(
            create: (ctx) => LoginBloc(loginRepository: loginRepository))
      ],
      child: MaterialApp(
        home: Scaffold(
          drawer: NavigationDrawer(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.welcomeScreenName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
