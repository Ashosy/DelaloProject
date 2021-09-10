import 'package:flutter/material.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key}) : super(key: key);

  @override
  HomeListViewState createState() => HomeListViewState();
}

class HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Text(
            "Top",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto"),
          ),
        ),
      ),
      Flexible(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  constraints:
                      BoxConstraints(minHeight: 200, minWidth: double.infinity),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text("List"),
                ),
              ),
            ]);
          },
        ),
      ),
      Container(
        padding: EdgeInsets.all(12),
        child: Text(
          "Top",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Roboto"),
        ),
      ),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Column(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.pink[100],
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text("List"),
                ),
              ),
            ]);
          },
        ),
      ),
    ]);
  }
}
