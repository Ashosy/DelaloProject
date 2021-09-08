import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowTitle.dart';
import 'package:delalo/delalo_app/screens/OrderJobScreens/widgets/rowContent.dart';

class ActiveJob extends StatelessWidget {
  ActiveJob({Key? key}) : super(key: key);

  final activeJob = [
    {
      "User": {
        "_id": "611da02f22b0e41684455e3d",
        "firstname": "User",
        "lastname": "One",
        "password": "1234",
        "email": "hey@gmail.com",
        "role": "user",
        "phone": "12345678",
        "address": "heyStreet",
        "__v": 0
      },
      "Provider": {
        "_id": "611da02f22b0e41684455e3d",
        "firstname": "User",
        "lastname": "One",
        "password": "1234",
        "email": "hey@gmail.com",
        "role": "user",
        "phone": "12345678",
        "address": "heyStreet",
        "__v": 0
      },
      "Order": {
        "_id": "611da02f22b0e41684455e3f",
        "status": "active",
        "is_completed": "false",
        "order_created_date": "14-08-2021",
        "start_time": "2021-08-19T00:05:03.427Z",
        "saved_time": 2,
        "unique_code": 12345,
        "seeker_id": 1,
        "provider_id": 3,
        "__v": 0
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You have 1 other request waiting.\nFinish the task at hand to accept another one',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Container(
            color: Colors.grey[100],
            child: Stack(
              children: [
                Container(
                    height: 400,
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    )),
                Column(
                  children: [
                    Container(
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              "Undertaking...",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.purple[700],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/lake.jpg'),
                      ),
                    ),
                    Text(
                      'User Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
