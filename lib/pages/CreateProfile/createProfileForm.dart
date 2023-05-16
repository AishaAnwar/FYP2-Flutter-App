import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:login/utils/constant.dart';
import 'package:image_picker/image_picker.dart';
import '../../firstpage.dart';
import '../../models/createProfileStudentModel.dart';
import '../../repository/profileRepo.dart';
import '../../utils/myGlobals.dart';

const List<String> list = <String>['Female', 'Male', 'Other'];

class dropdown extends StatefulWidget {
  const dropdown({super.key});
  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
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

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController headline = TextEditingController();
  TextEditingController interests = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController git = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController skill = TextEditingController();
  TextEditingController projects = TextEditingController();
  TextEditingController achievement = TextEditingController();
  TextEditingController activities = TextEditingController();
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List allTextField = [];
  List displayTextField = [];
  XFile? uploadimage;
  final ImagePicker picker = ImagePicker();
  Reference referenceRoot = FirebaseStorage.instance.ref();

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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
                    //if user click this button, user can upload image from gallery

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
                          "Create Profile",
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
                                'Upload Image',
                                style: kTitleStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Personal Information",
                    style: kTitleStyle,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: firstname,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("First Name"),
                      hintText: 'Enter first name.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required First Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: lastname,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Last Name"),
                      hintText: 'Enter last name.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Last Name  ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  dropdown(),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: address,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Address"),
                      hintText: 'Enter your address.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Address ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: headline,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: const InputDecoration(
                        label: Text("Headline"),
                        hintText: 'Enter your bio.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Headline';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Contact Information",
                    style: kTitleStyle,
                  ),
                  TextFormField(
                    controller: contactno,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Contact No"),
                      hintText: 'Enter contact no. e.g:"03XXXXXXXXX",',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 11
                        ? 'Enter a valid number without dash.'
                        : null,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: website,
                    decoration: const InputDecoration(
                      label: Text("Website"),
                      hintText: 'Enter website if any.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (website) {
                      String pattern =
                          r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
                      RegExp regExp = RegExp(pattern);
                      if (website!.isEmpty) {
                        return "Please enter your website";
                      } else if (!(regExp.hasMatch(website))) {
                        return "Website Url must be started from www";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      hintText: 'Enter your email. e.g: +92 000 0000000',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Name  ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: git,
                    decoration: const InputDecoration(
                      label: Text("Github"),
                      hintText: 'Enter your github link.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (website) {
                      String pattern =
                          r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
                      RegExp regExp = RegExp(pattern);
                      if (website!.isEmpty) {
                        return "Please enter your website";
                      } else if (!(regExp.hasMatch(website))) {
                        return "Website Url must be started from www";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: linkedin,
                    decoration: const InputDecoration(
                      label: Text("Linkedin"),
                      hintText: 'Enter your linkedin link.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (website) {
                      String pattern =
                          r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
                      RegExp regExp = RegExp(pattern);
                      if (website!.isEmpty) {
                        return "Please enter your website";
                      } else if (!(regExp.hasMatch(website))) {
                        return "Website Url must be started from www";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Educational Information",
                    style: kTitleStyle,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: education,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("Education"),
                        hintText: 'Enter your Education.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Education ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: interests,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Interest"),
                        hintText: 'Enter your professional interests.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required professional interests  ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: skill,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Skills"),
                        hintText: 'Enter your professional skills.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Skills';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: projects,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Projects"),
                        hintText: 'Enter your projects.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: achievement,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("Achievement"),
                        hintText: 'Enter your achievements.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: activities,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("Extracurricular Activities"),
                        hintText: 'Enter your extracurricular activities.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            
                            Reference referenceDirImages = referenceRoot.child('images');
                            String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
                            Reference referenceImagetoUpload = referenceDirImages.child(uniqueFileName);
                            await referenceImagetoUpload.putFile(File(uploadimage!.path));
                            imageURL1 = await referenceImagetoUpload.getDownloadURL();
                            profile = CreateProfileStudentModel(
                                firstName: firstname.text.trim(),
                                lastName: lastname.text.trim(),
                                image: imageURL1,
                                gender: gender.text.trim(),
                                address: address.text.trim(),
                                headline: headline.text.trim(),
                                contactNo: contactno.text.trim(),
                                website: website.text.trim(),
                                git: git.text.trim(),
                                linkedIn: linkedin.text.trim(),
                                interest: interests.text.trim(),
                                education: education.text.trim(),
                                skill: skill.text.trim(),
                                project: projects.text.trim(),
                                activities: activities.text.trim(),
                                achievement: achievement.text.trim(),
                                email: email.text.trim());
                            
                            var createProfileRepoInstance = CreateProfileRepo();
                            createProfileRepoInstance.createProfile(profile);

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => FirstPage()),
                                (Route route) => false);
                          }
                        },
                        child: Text(
                          "Submit Data",
                          style: kTitleStyle.copyWith(
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              )),
        ),
      ]),
    );
  }

  
}
