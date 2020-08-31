import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:testingapp/DataPage.dart';
import 'package:skystonescouting20192020/screens/PitScoutPage.dart';
import 'package:flutter/foundation.dart';
import 'package:skystonescouting20192020/PageMaster.dart';
import 'package:skystonescouting20192020/services/auth.dart';
import 'package:skystonescouting20192020/services/database.dart';
import '../models/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'AuthenticationScreen.dart';

var globalCollectionCode;
var globalCollectionName;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthorizationService _auth = AuthorizationService();
  bool loading = false;
  String code;
  var teamCollectionNameController = TextEditingController();
  var teamCollectionCodeController = TextEditingController();

  createOrLogInCollection() async {
      await Firestore.instance
          .collection(globalCollectionName)
          .document("MASTER")
          .setData({
        'collectionName': globalCollectionName,
        'code': globalCollectionCode,
      });
      print("I HAVE CREATED THIS COLLECTION CHECK IT");
      print(globalCollectionName);
      print(globalCollectionCode);


    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/background.jpg"),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Create Or Log In'),
                            content: Column(
                              children: [
                                Container(
                                  child: TextField(
                                    controller: teamCollectionNameController,
                                    onChanged: (string) {
                                      globalCollectionName=string.trim();
                                      print("OnChanged:string"+globalCollectionName);
                                    },
                                    decoration: InputDecoration(
                                        hintText:
                                            "Enter the name of your team collection"),
                                  ),
                                ),
                                Container(
                                  child: TextField(
                                    controller: teamCollectionCodeController,
                                    onChanged: (newString) {
                                      globalCollectionCode=newString.trim();
                                      print("OnChanged:string"+globalCollectionCode);
                                    },

                                    decoration: InputDecoration(
                                        hintText:
                                            "Enter the passcode for your team collection"),
                                      keyboardType:
                                          TextInputType.numberWithOptions(),
                                    ),
                                ),
                              ],
                            ),
                            actions: [
                              MaterialButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  teamCollectionNameController.clear();
                                  teamCollectionCodeController.clear();
                                  globalCollectionCode=null;
                                  globalCollectionName=null;
                                },
                              ),
                              MaterialButton(
                                child: Text('Submit'),
                                onPressed: () {
                                  createOrLogInCollection();
                                  teamCollectionNameController.clear();
                                  teamCollectionCodeController.clear();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PageMaster()));
                                },
                              )
                            ],
                          ));
                },
                child: Container(
                  height: 75,
                  width: 300,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Create or Log In",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),

            ],
          )),
    );
  }
}
