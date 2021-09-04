import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:/delalo/delalo_app/exports.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);
}
