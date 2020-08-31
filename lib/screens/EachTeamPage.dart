import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skystonescouting20192020/widgets/FieldScoutInformation.dart';
import 'package:skystonescouting20192020/widgets/PitScoutInformation.dart';
import 'package:skystonescouting20192020/services/database.dart';
import 'package:google_fonts/google_fonts.dart';
 List<Widget> _pitInfoListWidget=[];
int count =0;


class EachTeamPage extends StatefulWidget {

  Map<String,dynamic> pitInfo;
  String fieldNotes;
  EachTeamPage(this.pitInfo,this.fieldNotes);

  @override
  _EachTeamPageState createState() => _EachTeamPageState();
}

class _EachTeamPageState extends State<EachTeamPage> {
void initState()
{
  _pitInfoListWidget=[];
  printPitData();
  super.initState();
}

  List<Widget> printPitData()
  {
    print(widget.pitInfo.toString());
//    for(int i=1;i<10;i++)
//      {
//        print(pitInfo['pitMap'][i].toString());
//return new Text(pitInfo['pitMap'][i].toString());
//      }
    for(var value in widget.pitInfo['pitMap'].values)
      {
        print('CURR VALUE'+value.toString());
        _pitInfoListWidget.add(Text(value.toString()));
        count++;
      }
    print('THIS IS THE LIST'+_pitInfoListWidget.toString());
    print(count.toString());

    return _pitInfoListWidget;


//     pitInfo.forEach((value) {
//       print("HELLOO");
//          print(value.toString());
////          value==null? pitInfoListWidget.add(new Text(' ')) : pitInfoListWidget.add(new Text(value.toString()));
//        });

      //  print(i.toString());
//        pitInfoList.add(new Text(entryList[i].value.toString()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 40,
          ),
          Container(
              height: 320,
              width: 360,
              color: Colors.black,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Pit Scout",
                            style: GoogleFonts.abhayaLibre(
                              color: Colors.yellowAccent,
                              fontSize: 32,
                            )),
                      Container(
                        child: Column(
                          children: _pitInfoListWidget,
                        ),

                      ),
                      Container(
                        child: Column(
                          children: [
                            Text("Notes",
                                style: GoogleFonts.abhayaLibre(
                                  color: Colors.yellowAccent,
                                  fontSize: 18,
                                )),
                            Text(
                                widget.pitInfo['pitNotes'].toString()
                            ),

                          ],

                      ),)
                    ],
                  ),
                  ),
                  ),
          Container(
              height: 320,
              width: 360,
              color: Colors.black,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Field Scout",
                        style: GoogleFonts.abhayaLibre(
                          color: Colors.yellowAccent,
                          fontSize: 32,
                        )),
                    Text(widget.fieldNotes.toString())

                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(40, 30, 0, 40),
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.yellow,
                  splashColor: Colors.yellowAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          )
        ]));
  }
}
