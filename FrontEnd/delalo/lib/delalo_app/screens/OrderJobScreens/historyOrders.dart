import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';

class HistoryOrders extends StatelessWidget {
  HistoryOrders({Key? key}) : super(key: key);

  final historyOrders = [
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
    },
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
    },
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
    },
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
        "_id": "611ecc4f920d7b2db44d78c5",
        "status": "active",
        "is_completed": "false",
        "order_created_date": "14-08-2021",
        "start_time": "2021-08-19T21:25:35.006Z",
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
    return ListView.builder(
      itemCount: historyOrders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListTile(
            leading: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/lake.jpg'),
                  ),
                  Text(
                    'Provider Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            title: Text(
              '153.06ETB',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Category Type'),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Text('Addis Ababa'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Text('+251911111111'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.grey,
                        size: 16,
                      ),
                      Text(
                          'Sat, August 12, 2021 3:54 A.M. -\n Sat, August 13, 2021 3:54 P.M. '),
                    ],
                  ),
                  StarRating(
                    value: 3,
                    onChanged: null,
                  ),
                  Text('He did a good job. Satisfying service!')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
