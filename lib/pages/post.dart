import 'package:flutter/material.dart';
import 'package:login/utils/constant.dart';
import 'package:login/pages/job_page/jobPostForm.dart';
import 'package:login/pages/feed/feedPostForm.dart';
class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
                    height: 50,
                  ),
          // ElevatedButton(
          //           onPressed: () {
          //             Navigator.push(context, MaterialPageRoute(builder: (context) =>jobPostForm()));
          //           },
          //           style: ElevatedButton.styleFrom(
          //             primary: kblue,
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(50.0),
          //             ),
          //           ),
          //           child: Text(
          //             "Post Job",
          //             style: kTitleStyle.copyWith(
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>feedPostForm()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: Text(
                      "Post Feed ",
                      style: kTitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
        ])
        ,
      ),
    );
  }
}