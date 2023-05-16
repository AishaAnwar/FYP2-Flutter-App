import 'package:flutter/material.dart';
import 'package:login/models/jobModel.dart';
import 'package:login/utils/constant.dart';
import 'package:login/pages/job_page/job_tab.dart';
import 'package:login/pages/job_page/description_tab.dart';

class JobDetail extends StatelessWidget {
  final JobModel? job;
  JobDetail({this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        backgroundColor: kblue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          job!.companyName!,
          style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 50.0),
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
                    Center(
                      child: Container(
                        height: 75,
                        width: 75,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child:  Image.network('${job?.image}')
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      job!.title!,
                      style: kTitleStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      '\$${job!.minSal!}-\$${job!.maxSal!}K/year',
                      style: kSubtitleStyle,
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: job!.tag!
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
                    SizedBox(height: 25.0),
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
                          Tab(text: "Description"),
                          Tab(text: "Company"),
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
                    DescriptionTab(job: job),
                    JobTab(job: job),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
          // margin: EdgeInsets.only(bottom: 25.0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              InkWell(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: kBlack.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Icon(
                    Icons.bookmark_border,
                    color: kBlack,
                  ),
                ),
                onTap: () {
                  Icon(
                    Icons.bookmark,
                    color: Color(0xFF407BFF),
                  );
                },
              ),
              SizedBox(width: 15.0),
              Expanded(
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: kblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: Text(
                      "Apply for Job",
                      style: kTitleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
