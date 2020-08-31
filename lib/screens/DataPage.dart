import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skystonescouting20192020/screens/AuthenticationScreen.dart';
import 'package:skystonescouting20192020/screens/EachTeamPage.dart';
import 'package:skystonescouting20192020/screens/HomeScreen.dart';
import 'package:skystonescouting20192020/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataPage extends StatefulWidget {

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  bool isLoading = true;
  QuerySnapshot snapshot;

  retrieveAllInformation() async {
    DatabaseService service = new DatabaseService();
    return await service.getAllDocumentsFromCollection().then((val) {
      setState(() {
        snapshot = val;
        isLoading=false;
      });
    });
  }
  sendPitData(index){
//    int teamNumber = snapshot.documents[index].data['teamNumber'];
    Map<String,dynamic> pitMap = snapshot.documents[index].data['pitMap'];
    String pitNotes = snapshot.documents[index].data['pitNotes'].toString();
   Map<String,dynamic> finalPitMap = {
     'pitMap':pitMap,
     'pitNotes':pitNotes
   };
    return finalPitMap;
  }
  sendFieldData(index)
  {
    String fieldNotes = snapshot.documents[index].data['fieldNotes'].toString();
    return fieldNotes;
  }

  void initState() {
    super.initState();
    retrieveAllInformation();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Container(
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

      :
      ListView.builder(
        scrollDirection: Axis.vertical,
          itemCount: snapshot.documents.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.details),
              trailing: Icon(Icons.keyboard_arrow_right),
              title:
                  Text(snapshot.documents[index].data['teamNumber'].toString()),
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => EachTeamPage(sendPitData(index),sendFieldData(index))));
              },
            );
          }),
      //Container(
//            child: DataTable(
//              columns: [
//                DataColumn(label: Text('Team Number')),
//                DataColumn(label: Text('Skystone')),
//              ],
//              rows: [
//                DataRow(cells: [
//                  DataCell(Text('7350')),
//                  DataCell(Text('6'))
//
//                ]),
//                DataRow(cells: [
//                  DataCell(Text('00000')),
//                  DataCell(Text('6'))
//
//                ])
//
//              ],
//
//            ),
//          )
    );
  }
}
// Write a message to the database

//        Column(
//            children: [
//          Container(
//              child: FloatingActionButton(
//                  backgroundColor: Colors.yellow,
//                  onPressed: () {
//                    Navigator.pop(context);
//                    },
//                  )
//          ),
//              DataTable(
//
//
//              )
//        ])
//    );
//  }
//}
