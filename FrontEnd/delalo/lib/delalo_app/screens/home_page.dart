import 'package:flutter/material.dart';
import "hometools/listview.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final routeName = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: HomeListView(),
    );
  }
}
