import 'package:delalo/delalo_app/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'delalo_app/screens/allScreens.dart';

class RouteGenerator {
  static const String singleProviderPageName = "/";
  static const String loginScreenName = "/loginScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case singleProviderPageName:
        return MaterialPageRoute(builder: (_) => ProviderProfile());
      case loginScreenName:
        return MaterialPageRoute(builder: (_) => LoginForm());
      default:
        throw FormatException("Route was not found");
    }
  }
}
