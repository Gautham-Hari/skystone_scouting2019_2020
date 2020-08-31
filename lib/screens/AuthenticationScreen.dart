import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:testingapp/DataPage.dart';
import'package:flutter/foundation.dart';
import 'package:skystonescouting20192020/PageMaster.dart';
import 'package:skystonescouting20192020/services/auth.dart';
import '../models/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
var collectionName;
var collectionPasscode;
class Authentication extends StatefulWidget {




  @override
  _AuthenticationState createState() => _AuthenticationState();
}


class _AuthenticationState extends State<Authentication> {
  final AuthorizationService _auth = AuthorizationService();
  bool loading=false;
  String code;
  var teamPasswordController = TextEditingController();

  createOrLogInCollection() async
  {
    //create collection and create a master document with password
    await Firestore.instance.collection(collectionName).document("MASTER").setData({
      'collectionName':collectionName,
      'code':collectionPasscode,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
decoration: BoxDecoration(
  image:DecorationImage(
    image: AssetImage("images/background.jpg")
  )
),
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.fromLTRB(0, 25, 20, 2),
                child: FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageMaster()));
                  },
                )),

            Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                child: RaisedButton(
                  onPressed: () async {
                    var result = await _auth.signInAnony();

                    if (result == null) {
                      print('error');
                    }
                    else {
                      print(result.uid);
                    }
                  },
                  child: Text(
                      "HELLO"
                  ),
                )

            ),
            Container(
              child: RaisedButton(
                  child: Text("Team Password"),
                  onPressed: () {
                    return showDialog(context: context, builder: (context) {
                      return StatefulBuilder(
                          builder:(context,setState) {
                            return AlertDialog(
                                title: Text('Enter Team Password'),
                                content: TextField(
                                  obscureText: true,
                                  controller: teamPasswordController,
                                ),
                                actions: [
                                  MaterialButton(
                                    child: Text('Cancel'),
                                    onPressed: ()
                                    {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  MaterialButton(
                                    child: Text('Submit'),
                                    onPressed: () {
                                      print(teamPasswordController.text);
                                      Navigator.of(context).pop(teamPasswordController.text.toString);
                                    },

                                  ),

                                ]


                            );
                          }
                      );
                    });
                  }
              ),
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Passcode for Collection",
                  ),
                  onChanged: (numbers){
                  code = numbers;
                  },

              ),
            ),
            Container(
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () async {
                  collectionName=teamPasswordController.text;
                  collectionPasscode=code;
            createOrLogInCollection();
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

}


