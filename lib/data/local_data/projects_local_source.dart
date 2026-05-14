import 'package:portfolio/data/models/project_model.dart';

class ProjectsLocalSource {
  static final List<ProjectModel> projects = [
    ProjectModel(
      imagePath: [
        "assets/images/listenary_splash.jpeg",
        "assets/images/listenary_home.jpeg",
        "assets/images/listenary_reading.jpeg",
        "assets/images/listenary_search.jpeg",
        "assets/images/listenary_profile.jpeg",
      ],
      projectTitle: "Listenary",
      startDate: DateTime(2024, 1, 1),
      endDate: DateTime(2025, 6, 1),
      body:
          "OCR system that converts scanned files into digital text with translation, summarization, Text-to-Speech, and a free book library.",
      skills: [
        "Flutter",
        "Flask API",
        "Firebase",
        "MongoDB",
        "GetX",
        "OCR",
        "TTS",
      ],
      githubLink: "https://github.com/manaltaha555/Listenary",
    ),
    ProjectModel(
      imagePath: [
        "assets/images/tasky_dark.jpeg",
        "assets/images/tasky_light.jpeg",
      ],
      projectTitle: "Tasky",
      startDate: DateTime(2025, 6, 1),
      endDate: DateTime(2025, 7, 1),
      body:
          "Task management app to create and organize daily tasks with a clean UI and support for light and dark themes.",
      skills: ["Flutter", "Bloc", "Hive", "Theming"],
      githubLink: "https://github.com/manaltaha555/Tasky",
    ),
    ProjectModel(
      imagePath: [
        "assets/images/tal3a.png",
        "assets/images/tal3a_onboarding.png",
        "assets/images/tal3a_home.png",
      ],
      projectTitle: "Tal3a",
      startDate: DateTime(2024, 6, 1),
      endDate: DateTime(2025, 11, 1),
      body:
          "App for exploring restaurants, cafes, and malls in Alexandria with search, filters, maps integration, and multilingual support.",
      skills: [
        "Flutter",
        "Bloc",
        "Firebase",
        "Hive",
        "Theming",
        "Localization",
        "Google Maps API",
      ],
      githubLink: "https://github.com/nhahub/NHA-230",
    ),
  ];
}
