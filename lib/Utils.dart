import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();
class Utils {
  static showSnackBar(String? text, bool? a){
    final snackBar; 
    if(text == null) return;
    else if (a == true){
    snackBar = SnackBar(content: Text(text), backgroundColor: Colors.green);  
    }else{
    snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);
    }
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}