import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/hover_text.dart';

import '../../core/core.dart';

void tap(BuildContext context, VoidCallback action) {
  Navigator.pop(context);
  Future.delayed(const Duration(milliseconds: 150), action);
}

class AppEndDrawer extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onEducationTap;
  final VoidCallback onContactTap;

  const AppEndDrawer({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onEducationTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.25,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkBg.withAlpha(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Item(text: "Home", onTap: onHomeTap),
                Item(text: "About", onTap: onAboutTap),
                Item(text: "Skills", onTap: onSkillsTap),
                Item(text: "Projects", onTap: onProjectsTap),
                Item(text: "Experience", onTap: onExperienceTap),
                Item(text: "Education", onTap: onEducationTap),
                Item(text: "Contact", onTap: onContactTap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key, required this.onTap, required this.text});
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: HoverText(
        text: text,
        textColor: AppColors.textPrimary,
        onTap: () => tap(context, onTap!),
      ),
    );
  }
}
