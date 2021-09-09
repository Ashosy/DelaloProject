import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PendingJobs extends StatelessWidget {
  PendingJobs({Key? key}) : super(key: key);

  final pendingJobs = [
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
      itemCount: pendingJobs.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/lake.jpg'),
          ),
          title: Text(
            'Provider Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category Type'),
              ],
            ),
          ),
          trailing: Container(
            margin: EdgeInsets.all(0),
            width: 120,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ), // icon
                    Text(
                      'Accept',
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ), // text
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ), // icon
                    Text(
                      'Decline',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ), // text
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
