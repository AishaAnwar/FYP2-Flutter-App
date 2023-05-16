import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:login/login.dart';
import 'package:login/signup.dart';

class AuthPage extends StatefulWidget {
  final bool a;
  const AuthPage({
    Key? key,
    required this.a
  }) :super(key: key);
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  
  
  @override
  Widget build(BuildContext context) =>  isLogin
  ? LoginPage(onClickedSignUp: toggle) 
  : SignupPage(onClickedSignIn: toggle); 
  void toggle() => setState(()=> 
  isLogin = !isLogin);

  
}