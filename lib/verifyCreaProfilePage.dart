import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:login/firstpage.dart';
import 'package:login/animation/FadeAnimation.dart';
import 'package:login/Utils.dart';
import 'package:login/pages/CreateProfile/createProfileForm.dart';
import 'package:login/pages/profile/editProfileStudentForm.dart';
import 'package:login/utils/myGlobals.dart';

import 'models/createProfileStudentModel.dart';
class VerifyCreaProfilePage extends StatefulWidget {
  const VerifyCreaProfilePage({super.key});

  @override
  State<VerifyCreaProfilePage> createState() => _VerifyCreaProfilePage();
}

class _VerifyCreaProfilePage extends State<VerifyCreaProfilePage> {
   bool isCreated=false;
   final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState(){
  super.initState();
 
    final email= _auth.currentUser!.email;
    debugPrint(email);
    final _db = FirebaseFirestore.instance;
     _db.collection('Profiles')
    .where('Email', isEqualTo:email)
    .get().then((querySnapshot) {
    if (querySnapshot.size>0) {
      debugPrint("I am in if 1");
     setState((){
           debugPrint("I am in if 2");
           isCreated=false;});
           debugPrint("$isCreated");
          debugPrint("I am in if 3");
    } else if (querySnapshot.size==0) {
           debugPrint("I am in else 1");
       setState((){
        debugPrint("I am in else 2");
        isCreated=true;});
        debugPrint("$isCreated");
        debugPrint("I am in else 3");
      }});
   
  }
  @override
  void dispose(){
    
    super.dispose();
  }


  
  @override
  Widget build(BuildContext context) => isCreated 
   ? CreateProfile()
   : Scaffold(
     resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(""),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[  
                    FadeAnimation(
                          1,
                          Text(
                            "Profile is Created!",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                  FadeAnimation(1.2, Text("Profile is already created. You can update it.", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15
                  ),)),
                
              SizedBox(height: 24),
           FadeAnimation(1.5, MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            onPressed:()=>studentProfileFormState(),
                            shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                            child: Text(
                              "Update Profile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          )),
                          SizedBox(height: 15),
                          FadeAnimation(1.6, Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: ()=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) => FirstPage()), (Route route) => false),
                      color: Color(0xFF407BFF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("Cancel", style: TextStyle(
                        fontWeight: FontWeight.w600, 
                        fontSize: 18
                      ),),
                    ),
                  ))

        ],
      ),])
   ));

    
  }
