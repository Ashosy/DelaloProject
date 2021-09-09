import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      height: 170,
      padding: EdgeInsets.only(top:50),
      // margin: EdgeInsets.only(bottom:350),
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
            ),
            SizedBox(height: 10,),
            Text(
              "Current User",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                
              ),
         
            
            )
          ],
        ),
      ),
      
    );
  }
}