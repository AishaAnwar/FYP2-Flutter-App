import 'package:flutter/material.dart';
import 'package:login/models/student.dart';
import 'package:login/utils/constant.dart';
import 'package:login/models/jobModel.dart';

class details extends StatelessWidget {
  final Student? student;
  details({this.student});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            "Education",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Degree:',
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
              Text(
                student!.education!,
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 10.0),
          Text(
            "Interests",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              
              Text(
                student!.interest!,
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            "Achievement",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
           SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Text(
                student!.achievement!,
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            "Contact Information",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
            Icons.phone,
            color: kBlack,
          ),
              Text(
                'Contact:',
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
              Text(
                student!.contactNo!,
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
            ],
          ),
          
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Icon(
          //   Icons.githu,
          //   color: kBlack,
          // ),
              
              
          //   ],
          // ),
        ],
      ),
    );
  }
}
