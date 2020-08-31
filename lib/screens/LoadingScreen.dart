import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skystonescouting20192020/screens/AuthenticationScreen.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => Authentication()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                   Navigator.pushReplacement(context,
                     MaterialPageRoute(builder: (context) => Authentication()));
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: Image(
                      image: AssetImage('images/wattnxt.jpg'),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ),
                )
              ],
            ),
          ],
//            GestureDetector(
//              onTap: (){
//
//              },
//              child:
        ));
  }
}

//         P
//          child: CircularProgressIndicator(
//            strokeWidth: 7,
//            backgroundColor: Colors.black,
//            valueColor:
//            AlwaysStoppedAnimation<Color>
//              (Colors.yellow),
