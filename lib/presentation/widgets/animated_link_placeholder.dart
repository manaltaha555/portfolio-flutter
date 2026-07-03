import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/core/utils/handle_links.dart';

class AnimatedLinkPlaceholder extends StatelessWidget {
  AnimatedLinkPlaceholder({
    super.key,
    required this.text,
    required this.icon,
    required this.link,
  });

  final hoverNotifier = ValueNotifier(false);
  final String text;
  final IconData icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: hoverNotifier,
      builder: (context, isHover, child) {
        return InkWell(
          onHover: (hover) => hoverNotifier.value = hover,
          onTap: () {
            openLink(link);
          },
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: isHover ? 1 : 0),
            duration: const Duration(milliseconds: 250),
            builder: (context, value, child) {
              final t = (value * 0.7).clamp(0.0, 1.0);
              final gradient = LinearGradient(
                colors: [
                  Color.lerp(
                    const Color(0xFF7c3aed),
                    const Color(0xFF9F67FF),
                    t,
                  )!,
                  Color.lerp(
                    const Color(0xFFa855f7),
                    const Color(0xFFE0C3FF),
                    t,
                  )!,
                  Color.lerp(
                    const Color(0xFF8b5cf6),
                    const Color(0xFFA78BFA),
                    t,
                  )!,
                ],
              );

              return ShaderMask(
                shaderCallback: (bounds) {
                  return gradient.createShader(bounds);
                },
                child: Row(
                  children: [
                    Text(
                      text,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(icon, size: 18, color: AppColors.textPrimary),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
