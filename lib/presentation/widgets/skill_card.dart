import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/presentation/widgets/gradient_border_painter.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SkillCard extends StatelessWidget {
  SkillCard({super.key, required this.text, this.isInProject = false});

  final String text;
  final ValueNotifier<bool> hoverNotifier = ValueNotifier(false);
  final bool isInProject;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      // cursor: SystemMouseCursors.click,
      onEnter: (_) => hoverNotifier.value = true,
      onExit: (_) => hoverNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: hoverNotifier,
        builder: (context, isHover, child) {
          return TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 250),
            tween: Tween(begin: 0, end: isHover ? 1 : 0),
            builder: (context, value, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                transform: Matrix4.identity()
                  ..translateByVector3(vector.Vector3(0, isHover ? -6 : 0, 0))
                  ..scaleByVector4(
                    vector.Vector4(isHover ? 1.03 : 1.0, 1.03, 1.0, 1.0),
                  ),
                child: CustomPaint(
                  painter: GradientBorderPainter(progress: value),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: isInProject ? 8: 12, vertical: isInProject ? 6 : 10),
                    decoration: BoxDecoration(
                      color: AppColors.darkerBg.withAlpha(90),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      text,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: isInProject ? 9.sp.clamp(9, 12) : 14.sp.clamp(12, 16),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

