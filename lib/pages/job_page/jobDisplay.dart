import 'package:flutter/material.dart';
import 'package:login/models/jobModel.dart';
import 'package:login/utils/constant.dart';
import 'package:login/utils/myGlobals.dart';
import 'package:login/utils/system_ui.dart';
import 'package:login/pages/job_page/job_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/pages/job_page/job_tab.dart';
import 'package:login/pages/job_page/job_card.dart';
import 'package:login/pages/job_page/description_tab.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../repository/jobRepo.dart';

class jobDisplay extends StatefulWidget {
  const jobDisplay();

  @override
  State<jobDisplay> createState() => _jobDisplayState();
}

class _jobDisplayState extends State<jobDisplay> {
  
  late List<JobModel> _displayJobs;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _displayJobs = joobs;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            joobs = wholeJobModels;
            setState(() {
              _displayJobs = value != ''
                  ? joobs
                      .where((job) => job.title!
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList()
                  : joobs;
            });
          },
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              isCollapsed: true,
              hintText: 'Search for job',
              hintStyle:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14),
              suffixIconConstraints: const BoxConstraints(
                  minWidth: 36, maxWidth: 36, minHeight: 36, maxHeight: 36),
              contentPadding: const EdgeInsets.only(
                  right: 16, left: 16, top: 10, bottom: 12),
              suffixIcon: _searchController.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchController.text = '';
                          _displayJobs = joobs;
                        });
                      },
                      child: const Icon(Icons.close))
                  : null),
        ),
      ),
    );
  }

  Widget card({JobModel? job}) {
    return Container(
        height: 86,
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, blurRadius: 20, spreadRadius: 1)
            ]),
        child: InkWell(
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.network('${job?.image}')),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job!.title!,
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w600)),
                      Text(
                          '${job.companyName} | \$${job.minSal}-\$${job.maxSal}K/year',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.grey.shade800)),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              'Experience: ${job.minExp} Years',
                              style: GoogleFonts.inter(
                                  color: Colors.grey.shade800,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 6),
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade100,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              job.workHour!,
                              style: GoogleFonts.inter(
                                  color: Colors.grey.shade800,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetail(
                    job: job,
                  ),
                ),
              );
            }));
  }

  Future<List<DocumentSnapshot>> getAllJobDetails() async {
    final _db = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await _db.collection("Jobs").get();
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    systemUI();
    dropdownValue = "";
    imageURL = "";
    tempTag = ["", "", ""];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: FutureBuilder<List<DocumentSnapshot>>(
                future: getAllJobDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      List<DocumentSnapshot>? jobdata = snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 25.0),
                          Text(
                            "Popular Company",
                            style: kTitleStyle,
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            width: double.infinity,
                            height: 190.0,
                            child: Center(
                              child: ListView.builder(
                                itemCount: jobdata!.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  dropdownValue = "";
                                  imageURL = "";
                                  tempTag = ["", "", ""];
                                  JobModel singlejob =
                                      JobModel.fromSnapshot(jobdata[index]);
                                  wholeJobModels[index] = singlejob;
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => JobDetail(
                                            job: singlejob,
                                          ),
                                        ),
                                      );
                                    },
                                    child: index == 0
                                        ? JobCard(job: singlejob)
                                        : JobCard(job: singlejob),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Text(
                            "Recent Jobs",
                            style: kTitleStyle,
                          ),
                          SizedBox(height: 10.0),
                          FutureBuilder<List<DocumentSnapshot>>(
                              future: getAllJobDetails(),
                              builder: (context, snapshot) {
                                dropdownValue = "";
                                  imageURL = "";
                                  tempTag = ["", "", ""];
                                List<DocumentSnapshot>? displayJobs =
                                    snapshot.data;
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      // margin:const EdgeInsets.symmetric(horizontal: 10),
                                      child: ListView.separated(
                                        // padding: const EdgeInsets.symmetric(vertical: 12),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const ScrollPhysics(),
                                        itemCount: displayJobs!.length,
                                        itemBuilder: (context, index) {
                                          JobModel _singlejob =
                                              JobModel.fromSnapshot(
                                                  displayJobs[index]);
                                          return card(job: _singlejob);
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 12,
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return Text('Error: ${snapshot.error}');
                                  }
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ],
                      );
                    } else {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )));
  }
}
