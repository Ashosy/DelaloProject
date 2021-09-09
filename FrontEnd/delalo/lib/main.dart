import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/user_account_page.dart';
import 'package:delalo/delalo_app/screens/edit_profile_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: UserEditProfile(),
      ),
    );
  }
}
