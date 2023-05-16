import 'package:flutter/material.dart';
import 'package:login/models/jobModel.dart';
import 'package:login/firstpage.dart';
import 'package:login/models/student.dart';
import 'package:login/utils/constant.dart';
import 'package:login/pages/job_page/job_tab.dart';
import 'package:line_icons/line_icons.dart';
import 'package:login/pages/job_page/description_tab.dart';
import 'package:login/pages/profile/details.dart';
import 'package:login/pages/profile/skill.dart';
import 'package:login/pages/profile/activities.dart';
import 'package:login/pages/profile/editProfileFStudentForm.dart';

class profile extends StatelessWidget {
  final Student? student;
  profile({this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        backgroundColor: kblue,
        elevation: 0,
        actions: <Widget>[
         GestureDetector(
                onTap: () {},
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => studentProfileForm()));
                    },
                    icon: Icon(LineIcons.userEdit, color: Colors.black,)),
              ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
          ),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) => FirstPage()), (Route route) => false),
        ),
        title:Text(
                      "PROFILE",
                      style: TitleStyle,
                    ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 50.0),
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                
                constraints: BoxConstraints(maxHeight: 250.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset('assets/profile.jpg'),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '${student!.firstName!} ${student!.LastName!}',
                      style: kTitleStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      student!.headline!,
                      style: kSubtitleStyle,
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: student!.skill!
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 5.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border:
                                    Border.all(color: kBlack.withOpacity(.5)),
                              ),
                              child: Text(
                                e,
                                style: kSubtitleStyle,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 15.0),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: kBlack.withOpacity(.2),
                        ),
                      ),
                      // borderRadius: BorderRadius.circular(12.0),
                      child: TabBar(
                        labelColor: kBlack,
                        unselectedLabelColor: kBlack,
                        indicator: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        tabs: [
                          Tab(text: "Details"),
                          Tab(text: "Skills"),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 4.0),
              Expanded(
                child: TabBarView(
                  children: [
                    details(student: student),
                    skill(student: student),
                    // activities(student: student),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
