import 'package:delalo/delalo_app/screens/edit_profile_user.dart';
import 'package:flutter/material.dart';
import 'package:delalo/main.dart';

const appName = "Account Page";
const infostyle =
    TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.bold);
const detailstyle = TextStyle(fontSize: 17);

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key, required this.userInfo}) : super(key: key);
  final UserInfo userInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
              Container(
                height: 350,
                color: Colors.purple,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserEditProfile(user: userInfo),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.purple[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Details",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            "Name: ",
                            style: detailstyle,
                          ),
                          Text(
                            userInfo.name,
                            style: infostyle,
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Text(
                            "Email: ",
                            style: detailstyle,
                          ),
                          Text(
                            userInfo.email,
                            style: infostyle,
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Text(
                            "Phone Number: ",
                            style: detailstyle,
                          ),
                          Text(
                            userInfo.phoneNo,
                            style: infostyle,
                          ),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(children: [
                          Text(
                            "Address : ",
                            style: detailstyle,
                          ),
                          Text(
                            userInfo.address,
                            style: infostyle,
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.purple)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 22, horizontal: 3),
                            height: 70,
                            width: 80,
                            child: Text(
                              "Log Out",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21),
                            ),
                          )),
                      ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey.shade400)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 2),
                            height: 70,
                            width: 80,
                            child: Text(
                              "Delete Account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ))
                    ])
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
