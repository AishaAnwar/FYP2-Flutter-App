import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:login/models/createProfileStudentModel.dart';
import '../models/jobModel.dart';

class CreateProfileRepo extends GetxController {
  static CreateProfileRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Reference referenceRoot = FirebaseStorage.instance.ref();
  
  createProfile(CreateProfileStudentModel profile) async {
    // debugPrint('hI i am in job repo 1');
        await _db
            .collection("Profiles")
            .add(profile.toJson())
            .whenComplete(
                () => Utils.showSnackBar("Profile data added in firebase.", true))
            .catchError((error, stackTrace) {
          Utils.showSnackBar("Somethingwent wrong", true);
        });
        debugPrint('hI i am in job repo 2');
  }

  
}
