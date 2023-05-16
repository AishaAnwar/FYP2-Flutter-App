import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/myGlobals.dart';

class JobModel {
  final String? id;
  final String? title;
  final String? companyName;
  final String? aboutCompany;
  final String? image;
  final String? workHour;
  final String? minExp;
  final String? minSal;
  final String? maxSal;
  final String? position;
  final String? mode;
  final String? city;
  final String? country;
  final String? mainCriteria;
  final String? jobOpportunity;
  final String? jobResponsbilities;
  final List<String>? tag;

  const JobModel({
    this.id,
    required this.title,
    required this.companyName,
    required this.image,
    required this.workHour,
    required this.minExp,
    required this.minSal,
    required this.maxSal,
    required this.position,
    required this.city,
    required this.mode,
    required this.country,
    required this.tag,
    required this.mainCriteria,
    required this.jobOpportunity,
    required this.jobResponsbilities,
    required this.aboutCompany,
  });

  toJson() {
    return {
      "Title": title,
      "Company Name": companyName,
      "ImageURL": image,
      "Work Hour": workHour,
      "Min Exp": minExp,
      "Min Salary": minSal,
      "Max Salary": maxSal,
      "Position": position,
      "City": city,
      "Mode": mode,
      "Country": country,
      "Tags": tag,
      "Main": mainCriteria,
      "Job Opp": jobOpportunity,
      "Job Responsbilities": jobResponsbilities,
      "About Company": aboutCompany,
    };
  }

  factory JobModel.fromSnapshot(DocumentSnapshot<Object?> document) {
    final data = document;
    
    for(var i=0;i<3;i++)
      {
        tempTag![i]= data['Tags'][i];
        }
    return JobModel(
      id: document.id,
      title: data["Title"].toString(),
      companyName: data["Company Name"].toString(),
      image: data["ImageURL"].toString(),
      workHour: data["Work Hour"].toString(),
      minExp: data["Min Exp"].toString(),
      minSal: data["Min Salary"].toString(),
      maxSal: data["Max Salary"].toString(),
      position: data["Position"].toString(),
      city: data["City"].toString(),
      mode: data["Mode"].toString(),
      country: data["Country"].toString(),
      mainCriteria: data["Main"].toString(),
      jobOpportunity: data["Job Opp"].toString(),
      jobResponsbilities: data["Job Responsbilities"].toString(),
      aboutCompany: data["About Company"].toString(),
      tag: tempTag,
    );
  }
}

// List<Job> _jobs= [
//   Job(
//     title: 'Senior UI/UX Designer',
//     companyName: 'Google',
//     image: 'Google',
//     workHour: 'Full Time Job',
//     minSal: '240',
//     maxSal: '280',
//     minExp: '5',
//     position: 'Senior',
//     city: 'Karachi',
//     country: 'Pakistan',
//     tag: [
//       "Full Time",
//       "Remote",
//       "Anywhere",
//     ],
//     mainCriteria: "Full Time",
//     jobOpportunity:
//         "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
//     jobResponsbilities: [
//       "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
//       "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
//       "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
//     ],
//     aboutCompany:
//         "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
//   ),
//   Job(
//       title: 'UI/UX Designer',
//       companyName: 'Apple',
//       image: 'Apple',
//       workHour: 'Full Time Job',
//       minSal: '80',
//       maxSal: '90',
//       minExp: '1'),
//   Job(
//       title: 'UX Research Intern',
//       companyName: 'Reddit',
//       image: 'Reddit',
//       workHour: 'Internship',
//       minSal: '40',
//       maxSal: '50',
//       minExp: '1'),
//   Job(
//       title: 'Product Designer',
//       companyName: 'Dribbble',
//       image: 'Dribbble',
//       workHour: 'Full Time Job',
//       minSal: '60',
//       maxSal: '85',
//       minExp: '1'),
//   Job(
//       title: 'Senior Product Designer',
//       companyName: 'Figma',
//       image: 'Figma',
//       workHour: 'Full Time Job',
//       minSal: '80',
//       maxSal: '180',
//       minExp: '3'),
//   Job(
//       title: 'Software Developer Intern',
//       companyName: 'Adobe',
//       image: 'Adobe',
//       workHour: 'Internship',
//       minSal: '50',
//       maxSal: '60',
//       minExp: '1'),
//   Job(
//       title: 'UX Design Intern',
//       companyName: 'GitHub',
//       image: 'GitHub',
//       workHour: 'Internship',
//       minSal: '40',
//       maxSal: '50',
//       minExp: '1'),
//   Job(
//       title: 'Web Developer',
//       companyName: 'Notion',
//       image: 'Notion',
//       workHour: 'Full Time Job',
//       minSal: '80',
//       maxSal: '100',
//       minExp: '1'),
//   Job(
//       title: 'Mobile App Developer',
//       companyName: 'Tiktok',
//       image: 'TikTok',
//       workHour: 'Full Time Job',
//       minSal: '100',
//       maxSal: '120',
//       minExp: '2'),
//   Job(
//       title: 'Senior Software Engineer Lead',
//       companyName: 'Microsoft',
//       image: 'Microsoft',
//       workHour: 'Full Time Job',
//       minSal: '200',
//       maxSal: '250',
//       minExp: '5'),
//   Job(
//       title: 'Software Engineer Intern',
//       companyName: 'PayPal',
//       image: 'PayPal',
//       workHour: 'Internship',
//       minSal: '50',
//       maxSal: '55',
//       minExp: '1'),
//   Job(
//       title: 'UX Researcher',
//       companyName: 'Instagram',
//       image: 'Instagram',
//       workHour: 'Full Time Job',
//       minSal: '160',
//       maxSal: '200',
//       minExp: '4'),
//   Job(
//       title: 'Security Software Engineer',
//       companyName: 'Netflix',
//       image: 'Netflix',
//       workHour: 'Full Time Job',
//       minSal: '150',
//       maxSal: '200',
//       minExp: '4'),
//   Job(
//       title: 'Data Scientist - SMB',
//       companyName: 'Twitter',
//       image: 'Twitter',
//       workHour: 'Full Time Job',
//       minSal: '140',
//       maxSal: '160',
//       minExp: '3'),
// ];
