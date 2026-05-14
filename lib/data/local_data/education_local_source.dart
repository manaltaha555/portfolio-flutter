import 'package:portfolio/data/models/education_model.dart';

class EducationLocalSource {
  
  final List<EducationModel> educationList = [
    EducationModel(
      title: "Alexandria University",
      body: "Bachelor of Computer and Data Science",
      date: "January 2021 - June 2025",
      location: "Alexandria, Egypt",
      image: "assets/images/collage.png",
      grade: "Very Good",
    ),

    EducationModel(
      title: "Cross-platform Mobile App Development",
      body: "DEPI, Ministry of Communications and Information Technology",
      date: "June 2025 - December 2025",
      location: "Alexandria, Egypt",
      image: "assets/images/DEPI.png",
      details: [
        "Dart & Flutter framework development",
        "Mobile UI/UX principles and Firebase basics",
        "RESTful APIs & backend integration",
        "Project planning, testing, and soft skills development",
        "Business English for tech workplace",
        "Freelancing essentials with 3 real-world projects",
        "Career coaching, CV building, and mock interviews",
      ],
    ),
  ];
}
