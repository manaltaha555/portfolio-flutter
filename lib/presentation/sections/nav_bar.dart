import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/hover_text.dart';
import 'dart:ui';

class NavBar extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onEducationTap;
  final VoidCallback onMenuTap;
  final int selectedIndex;

  const NavBar({
    super.key,
    required this.onHomeTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
    required this.onExperienceTap,
    required this.onEducationTap,
    required this.onMenuTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkBg.withAlpha(10),
            border: Border(
              bottom: BorderSide(
                color: AppColors.border,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal : width < 700 ? 16 : 0,vertical: 16.h),
            child: width > 700 ? _desktopNav(context) : _mobileNav(context),
          ),
        ),
      ),
    );
  }

  Widget _desktopNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "MT",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.accent),
        ),
        Row(
          children: [
            HoverText(text: "Home", textColor: AppColors.textPrimary, onTap: onHomeTap, isSelected: selectedIndex == 0,),
            SizedBox(width: 24.w),
            HoverText(text: "About", textColor: AppColors.textPrimary, onTap: onAboutTap, isSelected: selectedIndex == 1,),
            SizedBox(width: 24.w),
            HoverText(text: "Skills", textColor: AppColors.textPrimary, onTap: onSkillsTap, isSelected: selectedIndex == 2,),
            SizedBox(width: 24.w),
            HoverText(text: "Projects", textColor: AppColors.textPrimary, onTap: onProjectsTap, isSelected: selectedIndex == 3,),
            SizedBox(width: 24.w),
            HoverText(text: "Experience", textColor: AppColors.textPrimary, onTap: onExperienceTap, isSelected: selectedIndex == 4,),
            SizedBox(width: 24.w),
            HoverText(text: "Education", textColor: AppColors.textPrimary, onTap: onEducationTap, isSelected: selectedIndex == 5,),
            SizedBox(width: 24.w),
            HoverText(text: "Contact", textColor: AppColors.textPrimary, onTap: onContactTap, isSelected: selectedIndex == 6,),
          ],
        ),
      ],
    );
  }

  Widget _mobileNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "MT",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.accent),
        ),
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: AppColors.textPrimary),
              onPressed: onMenuTap
            );
          },
        ),
      ],
    );
  }
}