import 'package:flutter/material.dart';
import 'delalo_app/screens/allScreens.dart';


class RouteGenerator {
 static const String singleProviderPageName = "/";

 static Route<dynamic> generateRoute(RouteSettings settings) {
   switch (settings.name) {
     case singleProviderPageName:
       return MaterialPageRoute(builder: (_) => ProviderProfile());
     default:
       throw FormatException("Route was not found");
   }
 }
}
