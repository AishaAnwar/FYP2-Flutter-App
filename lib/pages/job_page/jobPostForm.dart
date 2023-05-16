import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/utils/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../firstpage.dart';
import '../../models/jobModel.dart';
import '../../repository/jobRepo.dart';
import '../../utils/myGlobals.dart';

const List<String> list = <String>['Office-based', 'Remote-based', 'Hybrid'];

class jobPostForm extends StatefulWidget {
  const jobPostForm({super.key});

  @override
  State<jobPostForm> createState() => _jobPostFormState();
}

class dropdown extends StatefulWidget {
  const dropdown({super.key});
  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  @override
  Widget build(BuildContext context) {
    dropdownValue = list.first;
    return DropdownButton<String>(
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: kBlack),
      underline: Container(
        height: 10,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class _jobPostFormState extends State<jobPostForm> {
  TextEditingController title = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController workhour = TextEditingController();
  TextEditingController minexp = TextEditingController();
  TextEditingController minsal = TextEditingController();
  TextEditingController maxsal = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController maincriteria = TextEditingController();
  TextEditingController jobopp = TextEditingController();
  TextEditingController jobres = TextEditingController();
  TextEditingController aboutcompany = TextEditingController();
  TextEditingController tag1 = TextEditingController();
  TextEditingController tag2 = TextEditingController();
  TextEditingController tag3 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List allTextField = [];
  List displayTextField = [];
  XFile? uploadimage;
  final ImagePicker picker = ImagePicker();
  Reference referenceRoot = FirebaseStorage.instance.ref();

  final List<String>? tags = ["", "", ""];

//we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      uploadimage = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              'Please choose media to select',
              style: kTitleStyle.copyWith(
                color: Colors.white,
              ),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upluploadoad image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text(
                          'From Gallery',
                          style: kTitleStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text(
                          'From Camera',
                          style: kTitleStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allTextField = [
      {
        "label": "Tag # 01",
        "keyforbackend": "tag1",
        "value": tag1,
        "text_field": TextFormField(
          controller: tag1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required First Date ';
            }
            return null;
          },
        ),
      },
      {
        "label": "Tag # 02",
        "keyforbackend": "tag2",
        "value": tag2,
        "text_field": TextFormField(
          controller: tag2,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required Second Date ';
            }
            return null;
          },
        ),
      },
      {
        "label": "Tag # 03",
        "keyforbackend": "tag3",
        "value": tag3,
        "text_field": TextFormField(
          controller: tag3,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required last Date ';
            }
            return null;
          },
        ),
      }
    ];
  }

  addTextField() {
    print("addTextField");

    setState(() {
      if (allTextField.length == displayTextField.length) {
        print("Same");
        return;
      } else {
        displayTextField.add(allTextField[displayTextField.length]);
      }
    });
  }

  removeTextField() {
    print("removeTextField");

    setState(() {
      if (displayTextField.isNotEmpty) {
        displayTextField.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: kblue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Job Post",
                          style: TitleStyle,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                            height: 50.0,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ))),
                              onPressed: () {
                                myAlert();
                              },
                              child: Text(
                                'Upload Logo',
                                style: kTitleStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ]),
                  TextFormField(
                    controller: title,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Job Title"),
                      hintText: 'Enter job title.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title required.';
                      }
                    }
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: companyname,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("Company Name"),
                      hintText: 'Enter company name.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Company name required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: aboutcompany,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("About Company"),
                        hintText: 'Briefly describe about company.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Company Description is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: position,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("Job Position"),
                      hintText: 'Enter job position.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Job position is equired.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: city,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("City"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'City is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: country,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("Country"),
                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Country is required.';
                        }
                        return null;
                      },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: minexp,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("Experince"),
                      hintText: 'Enter experince range. e.g: 0-2',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Minimun experience is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: workhour,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("Work Hours"),
                      hintText: 'Enter work hours of job',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Work hours is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: minsal,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("Minimum Salary"),
                      hintText: 'Enter minimum salary in \$ per year. e.g 12',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Minimun salary is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: maxsal,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("Maximum Salary"),
                      hintText: 'Enter maximum salary in \$ per year. e.g 12',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Maximum salary is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: maincriteria,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("Job Criteria"),
                        hintText: 'Enter job\'s criteria.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Job criteria is required.';
                      }
                      return null;
                    }
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: jobres,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        label: Text("Job Responsbilities"),
                        hintText: 'Enter job\'s responsbilities',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Job resposibilities is required. ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: jobopp,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Job Opportunity"),
                        hintText: 'Brieflt describe about job opportunity',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  dropdown(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Tags :'),
                      ElevatedButton(
                        onPressed: addTextField,
                        child: const Text('Add'),
                      ),
                      ElevatedButton(
                        onPressed: removeTextField,
                        child: const Text('Remove'),
                      ),
                    ],
                  ),
                  ...displayTextField
                      .map(
                        (e) => Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, right: 12),
                              child: Text(
                                e['label'],
                              ),
                            ),
                            Expanded(child: e['text_field'])
                          ],
                        ),
                      )
                      .toList(),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      height: 50.0,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ))),
                          onPressed: () async{
                             if (_formKey.currentState!.validate()) {
                            debugPrint('hI i am in onPressed func 1');
                            Reference referenceDirImages = referenceRoot.child('images');
                            String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
                            Reference referenceImagetoUpload = referenceDirImages.child(uniqueFileName);
                            await referenceImagetoUpload.putFile(File(uploadimage!.path));
                            imageURL2 = await referenceImagetoUpload.getDownloadURL();                            
                            debugPrint("IMAGE URL : ${imageURL2}");
                            final job = JobModel(
                                title: title.text.trim(),
                                companyName: companyname.text.trim(),
                                aboutCompany: aboutcompany.text.trim(),
                                image: imageURL2,
                                workHour: workhour.text.trim(),
                                minExp: minexp.text.trim(),
                                minSal: minsal.text.trim(),
                                maxSal: maxsal.text.trim(),
                                position: position.text.trim(),
                                mode: dropdownValue,
                                city: city.text.trim(),
                                country: country.text.trim(),
                                mainCriteria: maincriteria.text.trim(),
                                jobOpportunity: jobopp.text.trim(),
                                jobResponsbilities: jobres.text.trim(),
                                tag: [
                                  tag1.text.trim(),
                                  tag2.text.trim(),
                                  tag3.text.trim()
                                ]);
                            debugPrint('hI i am in onPressed func 3');
                            var jobRepoInstance = JobRepository();
                            debugPrint('hI i am in onPressed func 4');
                            jobRepoInstance.createJob(job);
                            debugPrint('hI i am in onPressed func 5');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => FirstPage()),
                                (Route route) => false);
                          }},
                          child: Text(
                            'Submit Data',
                            style: kTitleStyle.copyWith(
                              color: Colors.white,
                            ),
                          )))
                ],
              )),
        ),
      ]),
    );
  }


}
