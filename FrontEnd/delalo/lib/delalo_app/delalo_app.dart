import 'dart:io';

import 'package:delalo/delalo_app/blocs/auth_bloc/login_bloc/login_bloc.dart';
import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/blocs/user/provider_profile_page_bloc/provider_profile_bloc.dart';
import 'package:delalo/delalo_app/blocs/user/provider_profile_page_bloc/reviews_of_provider_bloc.dart';
import 'package:delalo/delalo_app/data_provider/auth_data/login_data.dart';
import 'package:delalo/delalo_app/data_provider/auth_data/singupUser_data.dart';
import 'package:delalo/delalo_app/data_provider/data_provider.dart';
import 'package:delalo/delalo_app/data_provider/user_data/single_provider_page_data.dart';
import 'package:delalo/delalo_app/repository/auth_repository/login_repository.dart';
import 'package:delalo/delalo_app/repository/auth_repository/signupProvider_repository.dart';
import 'package:delalo/delalo_app/repository/auth_repository/signupUser_repository.dart';
import 'package:delalo/delalo_app/repository/user_repository/order_jobs_repository.dart';
import 'package:delalo/delalo_app/repository/user_repository/single_provider_page_repository.dart';
import 'package:delalo/delalo_app/screens/navigation_drawer/navigation.dart';
import 'package:delalo/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'blocs/auth_bloc/signupProvider_bloc/signupProvider_bloc.dart';
import 'blocs/auth_bloc/signupUser_bloc/signupUser_bloc.dart';
import 'data_provider/auth_data/singupProvider_data.dart';

class MyApp extends StatelessWidget {
  static final httpClient = http.Client();
  final orderRepository = OrderRepository(
      dataProvider: OrderDataProvider(
    httpClient: httpClient,
  ));

  final loginRepository =
      LoginRepository(dataProvider: LoginDataProvider(httpClient: httpClient));
  final signupUserRepository = SignupUserRepository(
      dataProvider: SignupUserDataProvider(httpClient: httpClient));
  final signupProviderRepository = SignupProviderRepository(
      dataProvider: SignupProviderDataProvider(httpClient: httpClient)); 
  final providerProfileRepository = ProviderProfileRepository(
      dataProvider: ProviderProfileDataProvider(httpClient: httpClient));        

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrderBloc(orderRepository: orderRepository)
            ..add(
              OrdersLoad(),
            ),
        ),
        BlocProvider(
            create: (context) => LoginBloc(loginRepository: loginRepository)),
        BlocProvider(
            create: (context) =>
                SignupUserBloc(signupUserRepository: signupUserRepository)),
        BlocProvider(
            create: (context) =>
                SignupProviderBloc(signupProviderRepository: signupProviderRepository)),
        BlocProvider(
            create: (context) =>
                ProviderProfileBloc(providerProfileRepository: providerProfileRepository)..add(LoadProviderInfo(providerId: "613a6d0efa94bb01f0afbfa5", seekerId: "6118e035e030821c38a75f24"))),
        BlocProvider(
            create: (context) =>
                ReviewsOfProviderBloc(providerProfileRepository: providerProfileRepository)..add(LoadReviewsOfProvider(providerId: "613a6d0efa94bb01f0afbfa5")))        

      ],
      child: MaterialApp(
        home: Scaffold(
          drawer: NavigationDrawer(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.loginScreenName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
