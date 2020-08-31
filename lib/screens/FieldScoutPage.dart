//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:skystonescouting20192020/screens/DataPage.dart';
//import 'package:skystonescouting20192020/main.dart';
//import 'package:skystonescouting20192020/screens/EachTeamPage.dart';
//import 'package:skystonescouting20192020/screens/PitScoutPage.dart';
//class FieldScoutPage extends StatefulWidget {
//
//  @override
//  _FieldScoutPageState createState() => _FieldScoutPageState();
//}
//
//class _FieldScoutPageState extends State<FieldScoutPage> {
//  @override
//  int counter = 0;
//
//  double total = 0;
//  double sliderVal = 0;
//  double anotherSliderVal = 0;
//  int newCounter = 0;
//  Color newColor = Colors.red;
//
//  void incrementCounter() {
//    setState(() {
//      counter++;
//    });
//  }
//
//  void decrementCounter() {
//    setState(() {
//      counter--;
//    });
//  }
//
//  calculateTotal() {
//    total = sliderVal + anotherSliderVal;
//    return total.toString();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.black26,
//        body:
//      Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: [
//              Container(
//                  width: 100,
//                  height: 100,
//                  alignment: Alignment.center,
//                  child: RaisedButton(
//                    color: Colors.blue,
//                    textColor: Colors.black,
//                    splashColor: Colors.red,
//                    onPressed: decrementCounter,
//                    child: Text('VALUE DOWN'),
//                  )),
//              Container(
//                  width: 100,
//                  height: 100,
//                  alignment: Alignment.center,
//                  child: RaisedButton(
//                      color: Colors.green,
//                      textColor: Colors.black,
//                      splashColor: Colors.red,
//                      onPressed: incrementCounter,
//                      child: Text('VALUE UP'))),
//              Container(
//                  alignment: Alignment.center,
//                  child: Text(sliderVal.toString(),
//                      style: TextStyle(color: Colors.red, fontSize: 50))),
//              Container(
//                  child: Slider(
//                value: sliderVal,
//                onChanged: (newSliderVal) {
//                  setState(() => sliderVal = newSliderVal);
//                },
//                min: 0,
//                max: 40,
//                divisions: 40,
//                label: '$sliderVal',
//              )),
//              Container(
//                  alignment: Alignment.center,
//                  child: Text(anotherSliderVal.toString(),
//                      style: TextStyle(color: Colors.red, fontSize: 50))),
//              Container(
//                  child: Slider(
//                value: anotherSliderVal,
//                onChanged: (newAnotherSliderVal) {
//                  setState(() => anotherSliderVal = newAnotherSliderVal);
//                },
//                min: 0,
//                max: 40,
//                divisions: 40,
//                label: '$anotherSliderVal',
//              )),
//              Container(
//                  color: Colors.yellow,
//                  child: RawMaterialButton(
//                      onPressed: () {
//                        setState(() {
//                          if (newColor == Colors.red) {
//                            newColor = Colors.green;
//                            print("Turned newColor to green");
//                          } else {
//                            newColor = Colors.red;
//                            print("Turned newColor to red");
//                          }
//                        });
//                      },
//                      fillColor: newColor,
//                      child: Text('Robot has disconnected'))),
//              Container(child: Text(calculateTotal())),
//              Container(
//                alignment: Alignment.bottomRight,
//                   child:FloatingActionButton(
//
//                backgroundColor: Colors.yellow,
//
//                onPressed: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => DataPage()));
//                },
//              ))
//            ]),
//
//
//    );
//  }
//}
//
////  class _HomePage extends State<HomePage> {
//
//// This widget is the root of your application.
//
////      child: Image(
////       image:
////         AssetImage('images/rE46MR6CHVHpxuy3-CyN8yhxyIZ5v7517HDqx5B3LQM.jfif')
//
////GestureDetector(
////onTap:() {
////setState(() {
////if (newColor == Colors.blue) {
////newColor = Colors.red;
////}
////else {
////newColor = Colors.blue;
////}
////}
////);
////}
