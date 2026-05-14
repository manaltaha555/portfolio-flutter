import 'package:portfolio/data/models/experience_model.dart';

class ExperienceLocalSource {
  final List<ExperienceModel> experiences = [
    ExperienceModel(
      companyName: "Quriv Technologies",
      role: "Flutter Developer",
      info: "June 2025 - Present | Alexandria",
      location: "Alexandria, Egypt",
      image: "assets/images/quriv.png",
      responsibilities: [
        "Delivered real-world industry projects",
        "Applied clean architecture in mobile apps",
        "Collaborated using Git in a team environment",
        "Optimized performance and debugged complex issues",
        "Contributed to full development lifecycle from build to deployment",
        "published apps on Google Play Store",
      ],
    ),
  ];
}
