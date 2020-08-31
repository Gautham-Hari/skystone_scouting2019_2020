
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:skystonescouting20192020/screens/FieldScoutPage.dart';
import 'package:skystonescouting20192020/screens/PitScoutPage.dart';
import 'package:skystonescouting20192020/screens/DataPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skystonescouting20192020/services/auth.dart';
import 'package:skystonescouting20192020/services/database.dart';
import '../models/collection.dart';
import 'dart:collection';
class newPitScoutPage extends StatefulWidget {
  @override
  _newPitScoutPageState createState() => _newPitScoutPageState();
}

class _newPitScoutPageState extends State<newPitScoutPage> {
  @override
  String autoParkingPosition = 'N/A',
      autoRepositionFoundation = 'N/A',
      capStonePlacement = 'N/A';
  int autoSkystones;
  bool isLoading = true;
  var towerHeightVal;
  bool canRepoFound = false, noRepoFound = false;
  Color newColor = Colors.red;
  final teamNumberController = TextEditingController();
  final notesOnTeamController = TextEditingController();
    Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
  AuthorizationService service = new AuthorizationService();
  QuerySnapshot masterSnapshot;
  List<String> stringList;
  Map<String, String> currentPitList = new Map<String,String>();
  int teamNumber;



  void initState() {
    super.initState();
    initialize();
    currentPitList ={};
  }
  Future<Null> savePreferences(option,questionIndex) async {
    print('JUST CHECKING:' + option.toString());
    print('HELLO' + currentPitList.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentPitList[questionIndex.toString()]=option;
  }


Future<Null> getPreferences()async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    stringList = prefs.getStringList('currentPitList');
}

 createOptions(allOptionsForQuestion,documentIndex){
    List<Widget> optionList = new List<Widget>();
    for (int optionIndex=0; optionIndex<allOptionsForQuestion.length;optionIndex++) {
      optionList.add(new ListTile(
        title: Text(allOptionsForQuestion[optionIndex].toString(),
          style: TextStyle(
            color: Colors.black,
          ),),
        onTap: () {
          
//chooseOption(allOptionsForQuestion, optionIndex);
          savePreferences(allOptionsForQuestion[optionIndex].toString(),documentIndex);
          print(currentPitList.toString());
          Navigator.pop(context);
        },
      ));

  }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
    borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
      ),
      child: new Column(
        children: optionList
      ),
    );

}
  initialize() async {
    DatabaseService newService = new DatabaseService();
    return await newService.getAllQuestionsFromMaster().then((val) {
      setState(() {
        masterSnapshot = val;
        isLoading = false;
      });
    });
  }

  dataStoring(int teamNumber, Map pitMap, String notes) async {
    Map<String, dynamic> pitUserMap = {
      'teamNumber': teamNumber,
      'pitMap':pitMap,
      'pitNotes': notes,
    };

    await service.updatePitUserData(pitUserMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 350, 0, 0),
              child: Column(
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                SizedBox(height: 60),
                Container(
                  child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    controller: teamNumberController,
                    decoration: InputDecoration(
                        filled: true,

                        focusColor: Colors.black,
                        labelText: 'Enter Team Number'),
                  ),
                ),
                Container(
                  child: Expanded(
                       child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: masterSnapshot.documents.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.details),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text(masterSnapshot
                                  .documents[index].data['question']
                                  .toString()),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      var allOptionsForQuestion = List.from(
                                          masterSnapshot.documents[index]
                                              .data['options']);

                                      var documentIndex = index;
                                      print('THIS IS THE DOCUMENTs INDEX'+documentIndex.toString());
                                      return createOptions(allOptionsForQuestion,documentIndex);

                                    });
                              },
                            );
                          }))),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 70,
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    controller: notesOnTeamController,
                    maxLines: 3,
                    autofocus: false,
                    decoration: InputDecoration(
                        filled: true,

                        focusColor: Colors.black,
                        labelText: 'Enter Any Notes (optional)'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20
                  ),
                  child: RawMaterialButton(
                    splashColor: Colors.black12,
                    onPressed: () {
                      print(notesOnTeamController.text);
                      print(teamNumberController.text);
                      print(currentPitList.toString());
                      teamNumber=int.parse(teamNumberController.text);
                      dataStoring(teamNumber,currentPitList,notesOnTeamController.text);
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Submitted"),
                            duration: Duration(seconds: 4),)
                      );
                                            //                      dataStoring(teamNumberController.text, autoParkingPosition,
//                          autoRepositionFoundation, autoSkystones,towerHeightVal,capStonePlacement,notesOnTeamController.text);
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
                ),
              ]));}

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
