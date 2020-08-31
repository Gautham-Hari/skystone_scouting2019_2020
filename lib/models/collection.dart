import 'package:cloud_firestore/cloud_firestore.dart';

class Collection{

   final String password;
   final int code;
  Collection(this.password,this.code);
  getPassword()
  {
  return password;
  }
  getCode()
  {
  return code;
  }



}

