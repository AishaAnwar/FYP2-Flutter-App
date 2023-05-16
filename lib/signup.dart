import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:login/main.dart';
import 'package:login/Utils.dart';
import 'package:login/animation/FadeAnimation.dart';
import 'package:login/utils/constant.dart';
import 'package:login/repository/user_repo/userRepo.dart';
import 'models/user.dart';

class SignupPage extends StatefulWidget {
  final Function() onClickedSignIn;
  const SignupPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  
  final formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String _password = '';
  String _confirmPassword = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Create an account, It's free",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )),
                ],
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                        1.2,
                        makeInput('1',
                            label: "First Name",
                            controller: firstnameController)),
                    FadeAnimation(
                        1.2,
                        makeInput('2',
                            label: "Last Name",
                            controller: lastnameController)),
                    FadeAnimation(
                        1.2,
                        makeInput('3',
                            label: "Email", controller: emailController)),
                    FadeAnimation(
                        1.2,
                        makeInput('4',
                            label: "Number", controller: numberController)),
                    FadeAnimation(
                        1.3,
                        makeInput('5',
                            label: "Password",
                            obscureText: true,
                            controller: passwordController)),
                  
                  ],
                ),
              ),
              FadeAnimation(
                  1.5,
                  Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: signUp,
                      color: Color(0xFF407BFF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              FadeAnimation(
                  1.5,
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(color: kBlack, fontSize: 16),
                          text: "Already have an account?",
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignIn,
                            text: 'Login',
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                fontSize: 18))
                      ])))
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),

      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message, false);
    }
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
     final user = UserModel(
      id:  auth.currentUser?.uid,
      email: emailController.text.trim(),
      firstname: firstnameController.text.trim(),
      lastname: lastnameController.text.trim(),
      password: passwordController.text.trim(),
      phoneNo: numberController.text.trim(),
      profileBool: false,
    );
    var UserRepositoryInstance = UserRepository();
    UserRepositoryInstance.createUser( user);
    }  
    
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Widget makeInput(String a,
      {label,
      obscureText = false,
      controller,
      textInputAction = TextInputAction.next}) {
    switch (a) {
      case "1":
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 1,
              ),
              TextFormField(
                controller: controller,
                obscureText: obscureText,
                textInputAction: textInputAction,
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 3 
                    ? 'Enter min 3 characters and max 20 characters'
                    : null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        }
        break;
      case "2":
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 1,
              ),
              TextFormField(
                controller: controller,
                obscureText: obscureText,
                textInputAction: textInputAction,
                keyboardType: TextInputType.text,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value !=  null && value.length < 3 
                    ? 'Enter min 3 characters and max 20 characters'
                    : null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        }
        break;
      case "3":
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 1,
              ),
              TextFormField(
                controller: controller,
                obscureText: obscureText,
                textInputAction: textInputAction,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        }
        break;
      case "4":
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 1,
              ),
              TextFormField(
                controller: controller,
                obscureText: obscureText,
                textInputAction: textInputAction,
                keyboardType: TextInputType.number,
                validator: (value) => value != null && value.length < 11
                    ? 'Enter a valid number without dash.'
                    : null,
                decoration: InputDecoration(
                  hintText: "03XXXXXXXXX",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        }
        break;
      case "5":
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 1,
              ),
              TextFormField(
                controller: controller,
                obscureText: obscureText,
                textInputAction: textInputAction,
                onChanged: (value) {
                  _password = value;
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              FlutterPwValidator(
                controller: controller,
                minLength: 8,
                uppercaseCharCount: 2,
                numericCharCount: 3,
                specialCharCount: 1,
                width: 400,
                height: 150,
                onSuccess: () {
                  Utils.showSnackBar("Strong Password!", true);
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        }
        break;
      default:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 1,
            ),
            TextFormField(
              controller: controller,
              obscureText: obscureText,
              textInputAction: textInputAction,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
    }
  }
}
