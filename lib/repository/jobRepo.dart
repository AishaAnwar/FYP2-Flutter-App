import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/jobModel.dart';

class JobRepository extends GetxController {
  static JobRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Reference referenceRoot = FirebaseStorage.instance.ref();
  String imageUrl = "";
  createJob(JobModel job) async {
    debugPrint('hI i am in job repo 1');
        await _db
            .collection("Jobs")
            .add(job.toJson())
            .whenComplete(
                () => Utils.showSnackBar("Job data added in firebase.", true))
            .catchError((error, stackTrace) {
          Utils.showSnackBar("Somethingwent wrong", true);
        });
        debugPrint('hI i am in job repo 2');
  }

  
}
