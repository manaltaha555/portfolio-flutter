import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';

class GradientText extends StatelessWidget {
  const GradientText({super.key, required this.text, this.style});
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShaderMask(
      shaderCallback: (bounds) {
        return AppColors.skillCardGradient.createShader(bounds);
      },
      child: Text(
        text,
        style:
            this.style ??
            theme.textTheme.titleSmall!.copyWith(color: Colors.white),
      ),
    );
  }
}
