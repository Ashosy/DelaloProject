import 'package:delalo/delalo_app/blocs/user/user_blocs.dart';
import 'package:delalo/delalo_app/models/models.dart';
import 'package:delalo/routeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowTitle.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowContent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:slider_button/slider_button.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:prompt_dialog/prompt_dialog.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

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
  bool _isButtonDisabled = false;

  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

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

  late OrderDetails order;

  @override
  Widget build(BuildContext context) {
    final specOrder = argObj['orderObj'];
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Details")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (_, orderState) {
              if (orderState is Loading) {
                return CircularProgressIndicator();
              }

              // () async {
              //                 _stopWatchTimer.onExecute
              //                     .add(StopWatchExecute.start);
              //               },

              //  onPressed: () async {
              //                 _stopWatchTimer.onExecute
              //                     .add(StopWatchExecute.stop);
              //               },

              return Column(children: [
                Text(specOrder.order!.id),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _isButtonDisabled = !_isButtonDisabled;
                      });
                    },
                    child: GradientProgressIndicator(
                      radius: 120,
                      duration: 3,
                      strokeWidth: 12,
                      gradientStops: const [
                        0.1,
                        0.9,
                      ],
                      gradientColors: const [
                        Colors.white,
                        Colors.purple,
                      ],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: StreamBuilder<int>(
                              stream: _stopWatchTimer.rawTime,
                              initialData: _stopWatchTimer.rawTime.value,
                              builder: (context, snap) {
                                final value = snap.data!;
                                final displayTime =
                                    StopWatchTimer.getDisplayTime(value,
                                        hours: _isHours);
                                return Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        displayTime,
                                        style: const TextStyle(
                                            fontSize: 40,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        value.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
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
                          // Icon(
                          //   Icons.play_circle_filled,
                          //   color: Colors.green,
                          //   size: 50.0,
                          // ),

                          Icon(
                            Icons.pause_circle_filled,
                            color: Colors.red,
                            size: 50.0,
                          ),
                        ],
                      ),
                    )),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: _isButtonDisabled ? () {} : null,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Complete job"),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple[800],
                            textStyle: const TextStyle(
                                fontSize: 20, color: Colors.white))),
                  ),
                ),
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
              ]);
            },
          ),
        ),
      ),
    );
  }
}
