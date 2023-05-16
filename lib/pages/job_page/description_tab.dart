import 'package:flutter/material.dart';
import 'package:login/utils/constant.dart';
import 'package:login/models/jobModel.dart';


class DescriptionTab extends StatelessWidget {
  final JobModel? job;
  List<String> subStrings = [];
  DescriptionTab({this.job});
  @override
  Widget build(BuildContext context) {
    makebullets(job!.jobResponsbilities!);
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            "About the Opportunity",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            job!.jobOpportunity!,
            style: kSubtitleStyle.copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
          SizedBox(height: 25.0),
          Text(
            "Job Responsbilities",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Column(
            children: subStrings
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
  makebullets(text){
    
 subStrings = text.split(RegExp(r','));
 
    
  }
}
