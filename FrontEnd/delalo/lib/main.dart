import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/user_account_page.dart';
import 'package:delalo/delalo_app/screens/edit_profile_user.dart';
import 'package:delalo/delalo_app/screens/category_page.dart';

class UserInfo {
  final String name;
  final String email;
  final String phoneNo;
  final String address;
  const UserInfo(this.name, this.email, this.phoneNo, this.address);
}

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
      home: CategoryPage(),
      // AccountPage(
      //     userInfo: UserInfo(
      //   "Janine Doe",
      //   "janine@doe.com",
      //   "0945633210",
      //   "Addis Ababa, 5kilo",
      // )),
    );
  }
}
