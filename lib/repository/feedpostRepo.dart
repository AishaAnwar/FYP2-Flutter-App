import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/Utils.dart';
import '../../models/postModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostRepository extends GetxController {
  static PostRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Reference referenceRoot = FirebaseStorage.instance.ref();
  String imageUrl = "";

  createPost(image, postDes) async {
    Reference referenceDirImages = referenceRoot.child('images');
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceImagetoUpload = referenceDirImages.child(uniqueFileName);

    await referenceImagetoUpload.putFile(File(image!.path));
    imageUrl = await referenceImagetoUpload.getDownloadURL();
    FirebaseAuth auth = FirebaseAuth.instance;
    final post = PostModel(
      id:  auth.currentUser?.uid,
      imageURL: imageUrl,
      postDescription: postDes.text.trim(),
    );
    await _db
        .collection("Posts")
        .add(post.toJson())
        .whenComplete(
            () => Utils.showSnackBar("Post data added in firebase.", true))
        .catchError((erroe, stackTrace) {
      Utils.showSnackBar("Somethingwent wrong", true);
    });
  }
}
