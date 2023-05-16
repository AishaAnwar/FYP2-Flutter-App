import 'package:flutter/material.dart';
import 'package:login/modules/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FirstPage extends StatelessWidget {
final user = FirebaseAuth.instance.currentUser!;
FirstPage({super.key});
  
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
      //   ),
      // ),
      body: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    )
    );
  }

}