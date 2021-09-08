import 'dart:convert';
import 'dart:io';

import 'package:delalo/delalo_app/models/models.dart';
import 'package:http/http.dart' as http;
class AdminProviderDataProvider {
  final _baseurl = 'http://127.0.0.1:3000';
  final http.Client httpClient;
  AdminProviderDataProvider({required this.httpClient})
      : assert(httpClient != null);

  Future<List<User>> getProvidersFromProvider() async{
    try{
      final response = await httpClient.get(Uri.https(_baseurl, "/provider"));
      if(
        response.statusCode == 200
      ){
        final providers = jsonDecode(response.body) as List;
        return providers.map((provider) => User.fromJson(provider)).toList();
        
      }
      else{
        throw Exception("Error");
      }
    }on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    }

  }
   Future<List> getProviderFromProvider(String id) async{
    try{
      final response = await httpClient.get(Uri.https(_baseurl, "/provider/:$id"));
      if(
        response.statusCode == 200
      ){
        final providers = jsonDecode(response.body) as List;
        return providers.map((provider) => User.fromJson(provider)).toList();
        
      }
      else{
        throw Exception("Error");
      }
    }on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    }

  }


}