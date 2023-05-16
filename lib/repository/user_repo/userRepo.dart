import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Utils.dart';

import '../../models/user.dart';
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  
    createUser(UserModel user) async{
      print("in job repo");
   await _db.collection("Users").add(user.toJson()).whenComplete(() => Utils.showSnackBar("User signed up.", true)).catchError((error, stackTrace){
    Utils.showSnackBar("Somethingwent wrong", true);
   });
  }
  
}