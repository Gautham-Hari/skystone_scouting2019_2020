import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:skystonescouting20192020/screens/FieldScoutPage.dart';
import 'package:skystonescouting20192020/screens/PitScoutPage.dart';
import 'package:skystonescouting20192020/screens/DataPage.dart';
import'package:google_fonts/google_fonts.dart';
import 'package:skystonescouting20192020/services/auth.dart';
import'../models/collection.dart';

class PitScoutPage extends StatefulWidget {

  @override
  _PitScoutPageState createState() => _PitScoutPageState();
}

class _PitScoutPageState extends State<PitScoutPage> {
  @override
  String autoParkingPosition = 'N/A',
      autoRepositionFoundation = 'N/A',
      capStonePlacement = 'N/A';
  int autoSkystones;
  var towerHeightVal;
  bool canRepoFound = false, noRepoFound = false;
  Color newColor = Colors.red;
  final teamNumberController = TextEditingController();
  final notesOnTeamController = TextEditingController();
  final towerHeightController = TextEditingController();

  AuthorizationService service = new AuthorizationService();

  dataStoring(String teamNumberText, String autoPark, String repoFound,
      int skystones,String towerHeightVal, String cap, String notes) async {
    Map<String, dynamic> userMap = {
      'teamNumber': teamNumberText,
      'autoPark': autoPark,
      'autoRepoFound': repoFound,
      'skystones': skystones,
      'towerHeight':towerHeightVal,
      'capStonePlacement':cap,
      'notes':notes,
    };

    await service.updatePitUserData(userMap);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: teamNumberController,
                  decoration: InputDecoration(

                      filled: true,
                      focusColor: Colors.black,
                      labelText: 'Enter Team Number'),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                title: Text(
                  "Auto Parking Position                  " +
                      autoParkingPosition,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      children: [
                        ListTile(
                          title: Text("Far"),
                          onTap: () {
                            setState(() {
                              autoParkingPosition = "Far";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("Close"),
                          onTap: () {
                            setState(() {
                              autoParkingPosition = "Close";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("Both"),
                          onTap: () {
                            setState(() {
                              autoParkingPosition = "Both";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("Can't Park"),
                          onTap: () {
                            setState(() {
                              autoParkingPosition = "Can't Park";
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                title: Text(
                  "Reposition Foundation                  " +
                      autoRepositionFoundation,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      children: [
                        ListTile(
                          title: Text("Yes"),
                          onTap: () {
                            setState(() {
                              autoRepositionFoundation = "Yes";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("No"),
                          onTap: () {
                            setState(() {
                              autoRepositionFoundation = "No";
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                title: Text(
                  "Skystones                                         " +
                      autoSkystones.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(

                      child: Column(
                        children: [
                          ListTile(
                            title: Text("0"),
                            onTap: () {
                              setState(() {
                                autoSkystones = 0;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text("1"),
                            onTap: () {
                              setState(() {
                                autoSkystones = 1;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text("2"),
                            onTap: () {
                              setState(() {
                                autoSkystones = 2;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                title: Text(
                  "Tower Height                                   " + towerHeightVal.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context){
                  return  Container(
                    width: double.infinity,
                      height: 400,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        controller: towerHeightController,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            focusColor: Colors.white,
                            labelText: 'Enter Tower Height'),

onEditingComplete: (){
                          setState(() {
                            towerHeightVal=towerHeightController.text;
                          });
                          Navigator.pop(context);
},                      )
                    );

                  });
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
                title: Text(
                  "Cap Stone                     " + capStonePlacement,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      children: [
                        ListTile(
                          title: Text("Yes, On Highest Level"),
                          onTap: () {
                            setState(() {
                              capStonePlacement = "Yes, On Highest Level";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("Yes, On Foundation"),
                          onTap: () {
                            setState(() {
                              capStonePlacement = "Yes, On Foundation";
                            });
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text("No"),
                          onTap: () {
                            setState(() {
                              capStonePlacement = "No";
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                child: TextField(
                  cursorColor: Colors.white,
                  controller: notesOnTeamController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusColor: Colors.white,
                      labelText: 'Enter Any Notes (optional)'),
                ),
              ),
              RawMaterialButton(
splashColor: Colors.black12,
                onPressed: () {

                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Submitted"),
                      duration: Duration(seconds: 4),)
                  );
                  dataStoring(teamNumberController.text, autoParkingPosition,
                      autoRepositionFoundation, autoSkystones,towerHeightVal,capStonePlacement,notesOnTeamController.text);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text("Submit",style:GoogleFonts.abhayaLibre(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
                  color: Colors.red,
                  height: 40,
                ),
              ),
            ]),
      ),
    );
  }
}



//  class _HomePage extends State<HomePage> {

// This widget is the root of your application.

//      child: Image(
//       image:
//         AssetImage('images/rE46MR6CHVHpxuy3-CyN8yhxyIZ5v7517HDqx5B3LQM.jfif')

//GestureDetector(
//onTap:() {
//setState(() {
//if (newColor == Colors.blue) {
//newColor = Colors.red;
//}
//else {
//newColor = Colors.blue;
//}
//}
//);
//}
