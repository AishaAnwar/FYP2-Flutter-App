import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login/pages/post.dart';
import 'package:login/pages/feed/feed.dart';
import 'package:login/firstpage.dart';
import 'package:login/pages/Extra/notification.dart';
import 'package:login/pages/job_page/jobDisplay.dart';
import 'package:login/modules/my_drawer_header.dart';
import 'package:login/pages/profile/profile.dart';
import 'package:login/pages/Extra/setting.dart';
import 'package:login/models/student.dart';
import 'package:login/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var padding = EdgeInsets.symmetric(horizontal: 18,vertical: 5);
  double gap =10;
final Student _student = Student(
  firstName  :'Aisha ',
  LastName  :'Anwar',
  gender  :'Female',
  address  :'xyz',
  location  :'Karachi, Pakistan',
  headline  :'Software Engineer',
  contactNo  :'+92 000 0000000',
  website  :'www.aishaanwar.com ',
  git  :'https://github.com/AishaAnwar',
  linkedIn  :'https://www.linkedin.com/in/aishaanwar/ ',
  interest  :'Machine Learning\, MERN \, Flutter',
  education  :'BS (Software Engineering)',
  skill  :['Machine Learning', 'MERN', 'Flutter'],
  project  :'Earn From Learn',
  activities  :'Automation Head',
  achievement  :'Astera Scholar',
) ;
 int _index = 0;
int currentIndex = 0;
  List<Text> text = [
    Text('Home', style: TextStyle(color: Colors.black.withOpacity(0.8))),
    Text('Post',style: TextStyle(color: Colors.black.withOpacity(0.8))),
    Text('Notification',style: TextStyle(color: Colors.black.withOpacity(0.8))),
    Text('Job',style: TextStyle(color: Colors.black.withOpacity(0.8))),
  ];

  List<Widget>pages =[
    feed(),
    post(),
    notification(),
    // jobDisplay(),
  ];
  PageController controller = PageController();
  var currentPage = DrawerSections.profile;
  @override
  Widget build(BuildContext context) {
    Widget currentScreen =feed();
  var container;
    if (currentPage == DrawerSections.profile) {
      container = profile(student: _student);
    } else if (currentPage == DrawerSections.setting) {
      container = setting();
    } else {
      container = profile(student: _student);
    } 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(

        ),
        drawer:Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
        body:PageView.builder(
          itemCount: 4,
            controller: controller,
            onPageChanged: (page){
              setState(() {
                _index= page;
              });
            },
            itemBuilder:(context,position){
              currentScreen = position == 0 ? feed() : position  == 1 ? post() : position == 2 ? notification():jobDisplay();
              return Container(
                color: Colors.white,
                
                child:Center(child: currentScreen),

              );
            }),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -15,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0,15),
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:0,vertical: 3),
              child: GNav(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 900),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.black,
                    text: 'Home',
                    textColor: Colors.black,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    iconSize: 27,
                    padding: padding,
                  ),
                  GButton(
                    icon: LineIcons.plusCircle,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.black,
                    text: 'Post',
                    textColor: Colors.black,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    iconSize: 27,
                    padding: padding,
                  ),
                  GButton(
                    icon: LineIcons.bell,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.black,
                    text: 'Notification',
                    textColor: Colors.black,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    iconSize: 27,
                    padding: padding,
                  ),
                  GButton(
                    icon: LineIcons.suitcase,
                    iconColor: Colors.black,
                    iconActiveColor: Colors.black,
                    text: 'Job',
                    textColor: Colors.black,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    iconSize: 27,
                    padding: padding,
                  ),
                ],
                selectedIndex: _index,
                onTabChange: (index){
                  setState(() {
                    _index =index;
                  });
                  controller.jumpToPage(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Profile", Icons.person_2_outlined,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(2, "Settings", Icons.settings,
              currentPage == DrawerSections.setting ? true : false),
          menuItem(3,"Sign-out", Icons.logout, true)
          
        ],
      ),
    );
  }
  void _showDialog(){
  showDialog(
    context: context, 
    builder: (context){
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Sign-out'),
          content: Text('Are you sure?'),
          actions: [
            MaterialButton(onPressed:(){
              () async => await FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },child: Text('Ok'),
            ),
            MaterialButton(onPressed:(){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) => FirstPage()), (Route route) => false);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
            },child: Text('Cancel'),
            ),
            

          ],
        );
    });
}
  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.profile;
              Navigator.push(context, MaterialPageRoute(builder: (context) => profile(student: _student,)));
            
            } else if (id == 2) {
              currentPage = DrawerSections.setting;
            } else if (id == 3) {
               _showDialog();
            } 
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


enum DrawerSections {
  profile,
  setting,
  // signout, 
}