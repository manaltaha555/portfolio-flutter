import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Column(
        children: [
          Text(
            text,
            style: theme.textTheme.headlineLarge!.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 100,
            height: 8.h,
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
