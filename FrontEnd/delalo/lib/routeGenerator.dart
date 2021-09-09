import 'package:flutter/material.dart';
import 'delalo_app/screens/allScreens.dart';

class RouteGenerator {
  static const String welcomeScreenName = "/welcomescreen";
  static const String getStartedScreenName = "/getStartedScreen";
  static const String signupChoiceName = "/signUpChoiceScreen";
  static const String singleProviderPageName = "/singleProviderPage";
  static const String loginScreenName = "/loginScreen";
  static const String signupUserScreenName = "/signupUserScreen";
  static const String ordersScreenName = "/orderScreen";
  static const String jobsScreenName = "/jobScreen";
  static const String orderDetailScreenName = "/orderDetails";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreenName:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case getStartedScreenName:
        return MaterialPageRoute(builder: (_) => GetStartedScreen());
      case loginScreenName:
        return MaterialPageRoute(builder: (_) => LoginForm());
      case signupChoiceName:
        return MaterialPageRoute(builder: (_) => SignupChoice());
      case signupUserScreenName:
        return MaterialPageRoute(builder: (_) => SignupUserForm());
      case singleProviderPageName:
        return MaterialPageRoute(builder: (_) => ProviderProfile());
      case ordersScreenName:
        return MaterialPageRoute(builder: (_) => OrdersScreen());
      case jobsScreenName:
        return MaterialPageRoute(builder: (_) => JobsScreen());
      case orderDetailScreenName:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (context) {
          return OrderDetailsScreen(
            argObj: args.argObj,
          );
        });

      default:
        throw FormatException("Route was not found");
    }
  }
}

class ScreenArguments {
  Map argObj;

  ScreenArguments(this.argObj);
}
