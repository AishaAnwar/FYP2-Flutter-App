library globals;

import '../models/createProfileStudentModel.dart';
import '../models/jobModel.dart';

String dropdownValue="";
String imageURL2="";
String imageURL1="";
String imageURL="";
CreateProfileStudentModel profile = CreateProfileStudentModel();
List<JobModel> _jobs = [
    JobModel(
      title: 'Senior UI/UX Designer',
      companyName: 'Google',
      image: 'Google',
      workHour: 'Full Time Job',
      minSal: '240',
      maxSal: '280',
      minExp: '5',
      position: 'Senior',
      city: 'Karachi',
      mode: '1',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'UI/UX Designer',
      companyName: 'Apple',
      image: 'Apple',
      workHour: 'Full Time Job',
      mode: '1',
      minSal: '80',
      maxSal: '90',
      minExp: '1',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:
        "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'UX Research Intern',
      companyName: 'Reddit',
      image: 'Reddit',
      workHour: 'Internship',
      mode: '1',
      minSal: '40',
      maxSal: '50',
      minExp: '1',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Product Designer',
      companyName: 'Dribbble',
      image: 'Dribbble',
      workHour: 'Full Time Job',
      mode: '1',
      minSal: '60',
      maxSal: '85',
      minExp: '1',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Senior Product Designer',
      companyName: 'Figma',
      image: 'Figma',
      workHour: 'Full Time Job',
      mode: '1',
      minSal: '80',
      maxSal: '180',
      minExp: '3',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Software Developer Intern',
      companyName: 'Adobe',
      image: 'Adobe',
      workHour: 'Internship',
      mode: '1',
      minSal: '50',
      maxSal: '60',
      minExp: '1',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'UX Design Intern',
      companyName: 'GitHub',
      image: 'GitHub',
      workHour: 'Internship',
      mode: '1',
      minSal: '40',
      maxSal: '50',
      minExp: '1',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Web Developer',
      companyName: 'Notion',
      image: 'Notion',
      mode: '1',
      workHour: 'Full Time Job',
      minSal: '80',
      maxSal: '100',
      minExp: '1',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Mobile App Developer',
      companyName: 'Tiktok',
      image: 'TikTok',
      workHour: 'Full Time Job',
      mode: '1',
      minSal: '100',
      maxSal: '120',
      minExp: '2',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Senior Software Engineer Lead',
      companyName: 'Microsoft',
      image: 'Microsoft',
      workHour: 'Full Time Job',
      mode: '1',
      minSal: '200',
      maxSal: '250',
      minExp: '5',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Software Engineer Intern',
      companyName: 'PayPal',
      image: 'PayPal',
      workHour: 'Internship',
      mode: '1',
      minSal: '50',
      maxSal: '55',
      minExp: '1',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'UX Researcher',
      companyName: 'Instagram',
      image: 'Instagram',
      workHour: 'Full Time Job',
      mode: '1',
      minSal: '160',
      maxSal: '200',
      minExp: '4',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities:  "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Security Software Engineer',
      companyName: 'Netflix',
      mode: '1',
      image: 'Netflix',
      workHour: 'Full Time Job',
      minSal: '150',
      maxSal: '200',
      minExp: '4',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobResponsbilities: "",
      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
    JobModel(
      title: 'Data Scientist - SMB',
      companyName: 'Twitter',
      image: 'Twitter',
      workHour: 'Full Time Job',
      mode: '1',
      minSal: '140',
      maxSal: '160',
      minExp: '3',
      position: 'Senior',
      city: 'Karachi',
      country: 'Pakistan',
      tag: [
        "Full Time",
        "Remote",
        "Anywhere",
      ],
      mainCriteria: "Full Time",
      jobResponsbilities: "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",
      jobOpportunity:
          "Calendly is looking for a UI/UX Designer in Marketing to Join our fast growing team. This role will report to the Director of UX and work alongside the marketing team to design experiences that help grow our business.",

      aboutCompany:
          "Maecenas dolor risus, luctus nec egestas id, dictum interdum lectus. Vivamus nec orci eget mauris luctus elementum. Donec nunc erat, viverra vitae suscipit quis, tempor dictum ligula. In nibh nulla, rhoncus ac lacinia tincidunt, luctus eu arcu. Proin nec nibh quis felis pellentesque pulvinar sit amet in justo. Sed hendrerit rutrum sem, in ornare ipsum bibendum sagittis. Donec tellus mi, facilisis ac nibh id, bibendum maximus diam. Quisque efficitur nunc purus, vel aliquet magna efficitur in. Cras pellentesque non massa vitae suscipit. Proin interdum turpis euismod quam finibus, id imperdiet felis lacinia.",
    ),
  ];
List<JobModel> wholeJobModels=_jobs;
List<String>? tempTag=["","",""];
List<JobModel> joobs=[];
