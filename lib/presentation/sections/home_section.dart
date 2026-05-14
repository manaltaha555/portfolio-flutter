import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/hover_bordered_button.dart';
import 'package:portfolio/presentation/widgets/hover_button.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key, required this.onGetInTouchPressed});

  final void Function()? onGetInTouchPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.darkerBg,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: -60.h,
            right: -40.w,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Container(
                width: 150.w.clamp(150, 160),
                height: 150.h.clamp(150, 160),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.darkBg.withAlpha(95),
                      AppColors.darkerBg.withAlpha(75),
                      AppColors.darkerBg.withAlpha(55),
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.25, 0.5, 1.0],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accent.withAlpha(150),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Manal Taha", style: theme.textTheme.headlineLarge),
                SizedBox(height: 35.h.clamp(35, 45)),
                Text(
                  "Mobile Flutter Developer",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 25.h.clamp(25, 35)),
                Wrap(
                  alignment: WrapAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Text(
                        "📍 Egypt, Alexandria",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Text(
                        "✉️ mnalth544@gmail.com",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    Text("📱 +201060584564", style: theme.textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: 15.h.clamp(13, 20)),
                Text(
                  "Turning ideas into elegant Flutter apps that blend performance, scalability, and clean architecture.",
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0.r),
                      child: HoverButton(
                        onPressed: onGetInTouchPressed,
                        text: "Get in Touch",
                      ),
                    ),
                    HoverBorderedButton(
                      onPressed: () async {
                        await openLink(
                          'https://drive.google.com/file/d/179VBM2ZiZENqav5dnl3ccAjhSqNP2IJ3/view?usp=sharing',
                        );
                      },
                      text: "Download My CV",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
