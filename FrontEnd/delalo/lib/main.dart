import 'package:delalo/delalo_app/blocs/blocs.dart';
import 'package:delalo/delalo_app/blocs/category/category_bloc.dart';
import 'package:delalo/delalo_app/blocs/category/category_event.dart';
import 'package:delalo/delalo_app/blocs/category/category_state.dart';
import 'package:delalo/delalo_app/screens/home_page.dart';
import 'package:delalo/delalo_app/delalo_app.dart';
import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/user_account_page.dart';
import 'package:delalo/delalo_app/screens/edit_profile_user.dart';
import 'package:delalo/delalo_app/screens/category_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delalo_app/data_provider/user_data/category_data.dart';
import 'delalo_app/repository/user_repository/category_repository.dart';
import 'delalo_app/delalo_app.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(MyApp());
}

