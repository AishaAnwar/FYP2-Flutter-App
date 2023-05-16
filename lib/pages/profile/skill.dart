import 'package:flutter/material.dart';
import 'package:login/models/student.dart';
import 'package:login/utils/constant.dart';
import 'package:login/models/jobModel.dart';

class skill extends StatelessWidget {
  final Student? student;
  skill({this.student});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            "Projects",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Project # 01:',
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
              Text(
                student!.project!,
                style: kSubtitleStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  height: 1.5,
                  color: Color(0xFF5B5B5B),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Text(
            "Skills",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
           Column(
            children: student!.skill!
                .map(
                  (e) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "•  ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 35.0),
                      ),
                      Expanded(
                        child: Text(
                          "$e\n",
                          style: kSubtitleStyle.copyWith(
                            fontWeight: FontWeight.w300,
                            height: 1.5,
                            color: Color(0xFF5B5B5B),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          )
         
        ],
      ),
    );
  }
}
