import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:skystonescouting20192020/screens/HomeScreen.dart';

class DatabaseService{



//  Future updateUserData(int teamNumber, String teamName, int skystones ) async
//  {
//    return await teamCollection.document(uid).setData({
//      'teamNumber':teamNumber,
//      'teamName':teamName,
//      'skystones':skystones,
//    });
//  }

  getAllDocumentsFromCollection()
  async {
    return await Firestore.instance.collection(globalCollectionName).where("teamNumber",isGreaterThan: 0).getDocuments();
  }
  getAllQuestionsFromMaster()
  async
  {
    return await Firestore.instance.collection("masterMastMaster0703").where('question').getDocuments();
  }


  //Lists of Teams from Snapshot
//  List<Teams> _teamListFromSnapshot(QuerySnapshot snapshot)
//  {
//    return snapshot.documents.map((doc){
//      return Teams(
//        teamNumber: doc.data['teamNumber'] ?? 0,
//        autoPark: doc.data['autoPark'] ?? 'n/a',
//        repoFound: doc.data['autoRepoFound'] ?? false,
//
//      );
//    }).toList();
//
//  }

  Stream<QuerySnapshot> get teamInformation{
    return Firestore.instance.collection('TeamCollection').where("teamNumber").getDocuments().asStream();
  }

}

