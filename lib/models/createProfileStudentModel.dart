import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProfileStudentModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? address;
  String? headline;
  String? contactNo;
  String? image;
  String? website;
  String? git;
  String? linkedIn;
  String? interest;
  String? education;
  String? skill;
  String? project;
  String? activities;
  String? achievement;
  String? email;

  CreateProfileStudentModel(
      {this.firstName,
      this.lastName,
      this.image,
      this.gender,
      this.address,
      this.headline,
      this.contactNo,
      this.website,
      this.git,
      this.linkedIn,
      this.interest,
      this.education,
      this.skill,
      this.project,
      this.activities,
      this.achievement,
      this.email});
  toJson() {
    return {
      "First Name": firstName,
      "Last Name": lastName,
      "Image Url": image,
      "Gender": gender,
      "Address": address,
      "Headline": headline,
      "Contact No": contactNo,
      "Website": website,
      "Git": git,
      "LinkedIn": linkedIn,
      "Interest": interest,
      "Education": education,
      "Skill": skill,
      "Project": project,
      "Activities": activities,
      "Achievement": achievement,
      "Email": email
    };
  }

  factory CreateProfileStudentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return CreateProfileStudentModel(
      firstName: data["First Name"].toString(),
      lastName: data["Last Name"].toString(),
      image: data["Image Url"].toString(),
      gender: data["Gender"].toString(),
      address: data["Address"].toString(),
      headline: data["Headline"].toString(),
      contactNo: data["Contact No "].toString(),
      website: data["Website"].toString(),
      git: data["Git"].toString(),
      linkedIn: data["LinkedIn"].toString(),
      interest: data["Interest"].toString(),
      education: data["Education"].toString(),
      skill: data["Skill"].toString(),
      project: data["Project"].toString(),
      activities: data["Activities"].toString(),
      achievement: data["Achievement"].toString(),
      email: data["Email "].toString(),
    );
  }
}
