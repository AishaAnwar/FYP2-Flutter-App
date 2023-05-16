import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/utils/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/postModel.dart';
import '../../repository/feedpostRepo.dart';

class feedPostForm extends StatefulWidget {
  const feedPostForm({super.key});

  @override
  State<feedPostForm> createState() => _feedPostFormState();
}

class _feedPostFormState extends State<feedPostForm> {
  TextEditingController postDescription = TextEditingController();
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
                          "Social Post",
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: postDescription,
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: const InputDecoration(
                        label: Text("Post Description"),
                        hintText: 'Enter post description.',
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
                    height: 20,
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
                          FirebaseAuth auth = FirebaseAuth.instance;
                          if (auth.currentUser != null) {
                            var postRepositoryInstance = PostRepository();
                            postRepositoryInstance.createPost(uploadimage,postDescription);
                          }
                        },
                        child: Text(
                          "Post",
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
