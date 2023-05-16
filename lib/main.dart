
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/animation/FadeAnimation.dart';
import 'package:login/Utils.dart';
import 'package:login/authPage.dart';
import 'package:login/utils/constant.dart';
import 'package:login/verifyEmailPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/firstpage.dart';
 
final navigatorKey = GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      home: HomePage(),
    )
  );
}

// class MyApp extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) =>MaterialApp(
//     navigatorKey: navigatorKey,
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   );
// }

class HomePage extends StatelessWidget {  
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges() ,
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
        }
        else if(snapshot.hasError){
          return Center(child: Text('Something went wrong!'));
        }
        else if (snapshot.hasData){
            return VerifyEmailPage();
        }else {

         return  SafeArea(
          child:Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children:<Widget>[
                    SizedBox(
                    height: 150,
                  ),  
                    FadeAnimation(1, Text("EARN", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:35,
                    color:Color(0xFF407BFF),
                  ),)),
                   FadeAnimation(1, Text("FROM", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: kBlack,
                  ),)),
                   FadeAnimation(1, Text("LEARN", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color:Color(0xFF407BFF),
                  ),)),]),
                  FadeAnimation(1.2, Text("Unlock your career potential with EarnFromLearn: Learn, Connect, and Succeed in the competitive job market.", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15
                  ),)),
                ],
              ),
              FadeAnimation(1.4, Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/welcome.png')
                  )
                ),
              )),
              Column(
                children: <Widget>[
                  FadeAnimation(1.5, MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage(a:true)));
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Login", style: TextStyle(
                      fontWeight: FontWeight.w600, 
                      fontSize: 18
                    ),),
                  )),
                  SizedBox(height: 15,),
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
                      onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(onClickedSignIn: )));
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage(a:false)));
                        
                      },
                      color: Color(0xFF407BFF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("Sign up", style: TextStyle(
                        fontWeight: FontWeight.w600, 
                        fontSize: 18
                      ),),
                    ),
                  ))
                ],
              )
            ],
          ),
        ));
                          // return AuthPage();
        }
        }
        ),
    );
  }
}