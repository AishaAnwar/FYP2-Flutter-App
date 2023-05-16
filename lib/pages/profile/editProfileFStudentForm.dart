import 'package:flutter/material.dart';
import 'package:login/utils/constant.dart';
import 'package:image_picker/image_picker.dart';

const List<String> list = <String>['Female', 'Male', 'Other'];

class studentProfileForm extends StatefulWidget {
  const studentProfileForm({super.key});

  @override
  State<studentProfileForm> createState() => _studentProfileFormState();
}

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

class _studentProfileFormState extends State<studentProfileForm> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController headline = TextEditingController();
  TextEditingController interests = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController git = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController skill = TextEditingController();
  TextEditingController projects = TextEditingController();
  TextEditingController achievement = TextEditingController();
  TextEditingController activities = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List allTextField = [];
  List displayTextField = [];
  XFile? uploadimage;
  final ImagePicker picker = ImagePicker();

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
                          "EDIT PROFILE",
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
                    decoration: const InputDecoration(
                      label: Text("First Name"),
                      hintText: 'Enter first name.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: lastname,
                    decoration: const InputDecoration(
                      label: Text("Last Name"),
                      hintText: 'Enter last name.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
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
                  dropdown(),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: address,
                    decoration: const InputDecoration(
                      label: Text("Address"),
                      hintText: 'Enter your address.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
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
                    controller: headline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: const InputDecoration(
                        label: Text("Headline"),
                        hintText: 'Enter your bio.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Name  ';
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
                    decoration: const InputDecoration(
                      label: Text("Contact No"),
                      hintText: 'Enter contact no. e.g: +92 000 0000000',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
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
                    controller: website,
                    decoration: const InputDecoration(
                      label: Text("Website"),
                      hintText: 'Enter website if any.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
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
                    controller: linkedin,
                    decoration: const InputDecoration(
                      label: Text("Linkedin"),
                      hintText: 'Enter your linkedin link.',
                      hintStyle:
                          TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Name  ';
                      }
                      return null;
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
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("Education"),
                        hintText: 'Enter your Education.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
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
                    controller: interests,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("Interest"),
                        hintText: 'Enter your professional interests.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
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
                    controller: skill,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("Skills"),
                        hintText: 'Enter your professional skills.',
                        hintStyle:
                            TextStyle(color: Color(0xFFCAC1DF), fontSize: 12),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: kBlack))),
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
                    controller: projects,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            List finalDynamicTextFieldValue = [];

                            if (displayTextField.isNotEmpty) {
                              for (int i = 0;
                                  i < displayTextField.length;
                                  i++) {
                                TextEditingController taxValue =
                                    displayTextField[i]['value'];

                                Map dummyMap = {
                                  "${displayTextField[i]['keyforbackend']}":
                                      taxValue.text
                                };
                                print(dummyMap);
                                finalDynamicTextFieldValue.add(dummyMap);
                              }
                            }

                            Map requiredFormDataForBackend = {
                              // 'title': title.text,
                              // "tag": finalDynamicTextFieldValue,
                              // 'compName': companyname.text,
                              // 'image': image,
                              // 'workHour': workhour.value,
                              // 'minExp': minexp.text,
                              // 'minSal': minsal.value,
                              // 'maxSak': maxsal.value,
                              // 'position': position.text,
                              // 'city': city.text,
                              // 'country': country.text,
                              // 'mainCriteria': maincriteria.text,
                              // 'jobOpp': jobopp.text,
                              // 'jobRes': jobres.text,
                              // 'aboutCompany': aboutcompany.text,
                            };
                            print("Final Data $requiredFormDataForBackend");
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
