
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skystonescouting20192020/screens/AuthenticationScreen.dart';
import 'package:skystonescouting20192020/screens/HomeScreen.dart';
//import 'package:testingapp/models/users.dart';
import 'package:skystonescouting20192020/services/database.dart';
import'package:skystonescouting20192020/models/users.dart';

class AuthorizationService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _fireBaseUser(FirebaseUser user)
  {
    return user!= null?Users(uid: user.uid):null;
  }
  updatePitUserData(userMap){

    Firestore.instance.collection(globalCollectionName).add(userMap);

  }
  updateFieldUserData(teamNumber,notes) async
  {
Firestore.instance.collection(globalCollectionName).where('teamNumber',isEqualTo: teamNumber).getDocuments().then((query) => query.documents.forEach((element) {
  Firestore.instance.collection(globalCollectionName).document(element.documentID).updateData({'fieldNotes':notes});

}));
  }
  createCollection({password}) async{

    await Firestore.instance.collection(password.toString()).add({
      'password':password
    });
    return;
  }



  Future signInAnony() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _fireBaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

}