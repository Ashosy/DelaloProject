import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ProviderProfile extends StatefulWidget {
  const ProviderProfile({Key? key}) : super(key: key);

  @override
  _ProviderProfileState createState() => _ProviderProfileState();
}

class _ProviderProfileState extends State<ProviderProfile> {
  Widget _nameLocationRating = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // provider name row
      Text(
        "Amsale Gebrehana",
        style: GoogleFonts.ibmPlexSans(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 10),
      // Location, rating row
      Row(
        children: [
          // Rating row
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                '4.6',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          // Location row
          Row(
            children: [
              Icon(
                Icons.place,
                color: Colors.green,
              ),
              Text(
                'Addis Ababa',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  Widget _hireInfo = Column(
    children: [
      // first two boxes row
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Per hour
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff61327D),
            ),
            width: 130,
            height: 130,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.green,
                      ),
                      Text(
                        '167',
                        style: GoogleFonts.ibmPlexSans(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Hourly Rate',
                    style: GoogleFonts.ibmPlexSans(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 50),
          // jobs done field
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff61327D),
            ),
            width: 130,
            height: 130,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.work,
                        color: Colors.green,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '8',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Jobs Done',
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 30),

      // second hire button row
      SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xffa1a1a1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: Text(
            "Sign in to hire",
            textAlign: TextAlign.center,
            style: GoogleFonts.ibmPlexSans(
                fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    ],
  );

// override===============================================================
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(decoration: TextDecoration.none, color: Colors.black),
      child: SingleChildScrollView(
        child: Container(
          height: 1200,
          padding: EdgeInsets.only(top: 40, bottom: 30, left: 15, right: 15),
          child: Column(
            children: [
              // first profile row section
              Row(
                children: [
                  Image.asset(
                    'assets/images/user.png',
                    width: 85,
                    height: 85,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  _nameLocationRating,
                ],
              ),
              SizedBox(height: 25),

              // second(Description)  section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'About',
                      style: GoogleFonts.ibmPlexSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(14),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          spreadRadius: -1.0,
                          blurRadius: 1.0,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        'Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut Ipedit sit sunt quaerat, odit. uid culpa officia aut Ipedit sit sunt uid culpa officia aut Ipedit sit sunt. uid culpa officia aut Ipedit sit suntuid culpa officia aut Ipedit sit sunt',
                        style: GoogleFonts.ibmPlexSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),

              // third row about hire infos
              _hireInfo,
              SizedBox(height: 30),

              // Reviews Section
              Text(
                'Work History and Feedback',
                textAlign: TextAlign.start,
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        spreadRadius: -1.0,
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int i) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff61327D),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Negus Haylemariam ' + i.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.ibmPlexSans(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      color: Colors.yellow,
                                      child: Text(
                                        '4.7',
                                        style: GoogleFonts.ibmPlexSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      'from 25/07/2019 to 04/08/2019',
                                      style: GoogleFonts.ibmPlexSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem',
                                  style: GoogleFonts.ibmPlexSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
