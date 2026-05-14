import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/headline_text.dart';
import 'package:portfolio/presentation/widgets/skill_card.dart';
import 'package:portfolio/presentation/widgets/static_gradient_border.dart';
import 'package:portfolio/presentation/widgets/technical_skills_widget.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<String> softSkills = [
    "Time Management",
    "Teamwork",
    "Problem Solving",
    "Critical Thinking",
    "Communication",
    "Attention To Detail",
  ];

  final List<String> languages = ["Arabic (Native)", "English (Very good)"];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              HeadlineText(text: "Skills"),
              SizedBox(height: 24),

              isMobile
                  ? Column(
                      children: [
                        _technicalSection(textTheme),
                        SizedBox(height: 24),
                        _softSection(textTheme, context),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _technicalSection(textTheme)),
                        SizedBox(width: 32.w),
                        Expanded(child: _softSection(textTheme, context)),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _technicalSection(TextTheme textTheme) {
    return CustomPaint(
      painter: StaticGradientBorderPainter(),
      child: Container(
        padding: EdgeInsets.all(32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Technical Skills",
              style: textTheme.titleMedium!.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 20),

            TechnicalSkillsWidget(
              title: "Mobile Development",
              skills: [
                "Flutter & Dart",
                "Provider",
                "GetX",
                "Bloc & Cubit",
                "RESTful APIs",
                "MVVM",
                "Push & Local Notifications",
                "Localizations",
                "Theming",
                "Local Database",
                "Google Play Console",
                "App Store & App Connect",
              ],
            ),

            SizedBox(height: 15),

            TechnicalSkillsWidget(
              title: "Database",
              skills: ["Firebase", "Supabase"],
            ),

            SizedBox(height: 15),

            TechnicalSkillsWidget(
              title: "Debug & Testing",
              skills: [
                "Unit Testing",
                "Widget Testing",
                "Mockito",
                "Integration Testing",
              ],
            ),

            SizedBox(height: 15),

            TechnicalSkillsWidget(
              title: "Version Control",
              skills: ["Git", "Github"],
            ),

            SizedBox(height: 15),

            TechnicalSkillsWidget(
              title: "Architecture",
              skills: [
                "OOP",
                "SOLID Principles",
                "Algorithm",
                "Data Structure",
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _softSection(TextTheme textTheme, BuildContext context) {

    return CustomPaint(
      painter: StaticGradientBorderPainter(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(32.w.clamp(16, 32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Soft Skills",
              style: textTheme.titleMedium!.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 12,
              children: softSkills
                  .map((skill) => SkillCard(text: skill))
                  .toList(),
            ),

            SizedBox(height: 40),

            Text(
              "Languages",
              style: textTheme.titleMedium!.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 12,
              children: languages
                  .map((skill) => SkillCard(text: skill))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
