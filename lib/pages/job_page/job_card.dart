import 'package:flutter/material.dart';
import 'package:login/utils/constant.dart';
import 'package:login/models/jobModel.dart';

class JobCard extends StatelessWidget {
  final JobModel? job;
  JobCard({this.job});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      margin: EdgeInsets.only(right: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0xFF407BFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12)),
                child:  Image.network('${job?.image}')
              ),
              Spacer(),
              Text(
                '\$${job!.minSal!}-\$${job!.maxSal!}K/year',
                style: kTitleStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Text(
            job!.title!,
            style: kTitleStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: job!.companyName,
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "  •  ",
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: job!.city,
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: job!.tag!
                  .map(
                    (e) => Container(
                      height: 25,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: Text(
                        e,
                        style: kSubtitleStyle.copyWith(
                          color: Colors.black,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
