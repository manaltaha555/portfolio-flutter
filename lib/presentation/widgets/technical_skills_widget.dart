import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/skill_card.dart';

class TechnicalSkillsWidget extends StatelessWidget {
  const TechnicalSkillsWidget({
    super.key,
    required this.skills,
    required this.title,
  });

  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
      // margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.bgGlass.withAlpha(20),
        border: Border.all(color: AppColors.border.withAlpha(5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return AppColors.skillCardGradient.createShader(bounds);
            },
            child: Text(
              title,
              style: theme.textTheme.titleSmall!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 12,
            children: skills
                .map((skill) => SkillCard(text: skill))
                .toList(),
          ),
        ],
      ),
    );
  }
}

