import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/headline_text.dart';
import 'package:portfolio/presentation/widgets/technical_skills_widget.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;
    final double horizontalPadding = isMobile ? 18.w.clamp(16, 18) : width * 0.25;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          HeadlineText(text: "Skills"),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TechnicalSkillsWidget(
                  title: "Languages & Frameworks",
                  skills: ["Dart", "Flutter", "Python", "Java Script", "Java"],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "State Management",
                  skills: ["BLoC", "Cubit", "Provider", "GetX", "Riverpod"],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "Architecture & Principles",
                  skills: [
                    "MVVM",
                    "SOLID Principles",
                    "Clean Architecture",
                    "Separation Of Concerns",
                  ],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "Backend & Services",
                  skills: [
                    "Supabase",
                    "Firebase",
                    "RESTful APIs with Dio and https",
                    "Push Notifications",
                    "NestJs",
                    "NodeJs",
                    "Flask",
                    "MongoDB",
                  ],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "Storage & Databases & Caching",
                  skills: [
                    "Hive",
                    "Sqflite",
                    "SharedPreferences Local Storage",
                    "Secure Storage",
                  ],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "UI & UX",
                  skills: [
                    "Responsive Design",
                    "Animations",
                    "Theming",
                    "Localization",
                  ],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "Testing & Debugging",
                  skills: [
                    "Unit Testing",
                    "Widget Testing",
                    "Integration Testing",
                    "Flutter DevTools",
                  ],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "Version Control & Collaboration",
                  skills: ["Git", "GitHub"],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "AI Tools & Automation",
                  skills: [
                    "AI-assisted Coding",
                    "Debugging",
                    "Code Optimization",
                    "UI Prototyping",
                    "Prompt Engineering",
                  ],
                ),

                SizedBox(height: 15),

                TechnicalSkillsWidget(
                  title: "Project Management",
                  skills: ["Trello", "Agile Development"],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}