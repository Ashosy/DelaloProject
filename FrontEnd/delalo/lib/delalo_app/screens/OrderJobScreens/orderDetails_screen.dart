import 'package:delalo/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowTitle.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowContent.dart';

// import 'package:slider_button/slider_button.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

import 'gradient_progress_indicator.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const String routeName = '/orderDetails';
  final Map argObj;

  OrderDetailsScreen({Key? key, required this.argObj}) : super(key: key);

  @override
  _OrderDetailsScreenState createState() =>
      _OrderDetailsScreenState(argObj: argObj);
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final Map argObj;

  _OrderDetailsScreenState({required this.argObj});

  Future _asyncInputDialog(BuildContext context) async {
    String unqiueCode = '';
    return showDialog(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please enter unique code'),
          content: new Row(
            children: [
              new Expanded(
                  child: new TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.purple,
                autofocus: true,
                decoration: new InputDecoration(
                    // errorText: 'Please try again',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2.0),
                    ),
                    // errorStyle: TextStyle(color: Colors.red),
                    labelStyle: TextStyle(color: Colors.purple),
                    labelText: 'Unique Code',
                    hintText: '4-digit code'),
                onChanged: (value) {
                  unqiueCode = value;
                },
              ))
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[700],
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.white)),
                onPressed: () {
                  print(unqiueCode);
                  Navigator.of(context).pop(unqiueCode);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        );
      },
    );
  }

  final _rating_dialog = RatingDialog(
    // your app's name?
    title: 'Rate your Service',
    // encourage your user to leave a high rating?

    // your app's logo?
    image: const FlutterLogo(size: 100),
    submitButton: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
    },
  );

  late String order;

  @override
  Widget build(BuildContext context) {
    final order = argObj['order'];
    print(order);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Details")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(children: [
            Text(order.order.id),
            Container(
                child: GradientProgressIndicator(
              radius: 120,
              duration: 3,
              strokeWidth: 12,
              gradientStops: const [
                0.2,
                0.8,
              ],
              gradientColors: const [
                Colors.white,
                Colors.purple,
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Total',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    '39 ETB',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '2:17:30',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple[800],
                        textStyle:
                            const TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => _rating_dialog,
                      );
                    },
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.green,
                      size: 30.0,
                    ),
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //       primary: Colors.red,
                  //       textStyle:
                  //           const TextStyle(fontSize: 20, color: Colors.white)),
                  //   onPressed: () {
                  //     print("pressed");
                  //   },
                  //   child: Icon(
                  //   Icons.pause_circle_outline,
                  //   color: Colors.green,
                  //   size: 30.0,
                  // ),
                  // ),
                ],
              ),
            )),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       margin: EdgeInsets.only(top: 10),
            //       child: SliderButton(
            //         alignLabel: Alignment.center,
            //         buttonSize: 40,
            //         height: 40,
            //         width: 450,
            //         action: () {
            //           ///Do something here
            //           // Navigator.of(context).pop();

            //           // showDialog(
            //           //   context: context,
            //           //   builder: (context) => _rating_dialog,
            //           // );

            //           // _asyncInputDialog(context);
            //         },
            //         label: Text(
            //           "Swipe to complete",
            //           style: TextStyle(
            //               color: Color(0xff4a4a4a),
            //               fontWeight: FontWeight.w500,
            //               fontSize: 17),
            //         ),
            //         icon: Text(
            //           "x",
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.w400,
            //             fontSize: 44,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowTitle(title: 'Service'),
                              RowTitle(title: 'Phone Number'),
                              RowTitle(title: 'Address'),
                              RowTitle(title: 'Order Created'),
                              RowTitle(title: 'Unique Code'),
                            ],
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RowContent(content: 'Delivery'),
                              RowContent(content: '+251943567890'),
                              RowContent(content: 'Addis Ababa'),
                              RowContent(content: '06/08/21 3:58 A.M'),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '3456',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
