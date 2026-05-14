import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class HoverButton extends StatelessWidget {
  HoverButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  final hoverNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ValueListenableBuilder<bool>(
      valueListenable: hoverNotifier,
      builder: (context, isHover, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(
            0,
            isHover ? -3.h : 0.h, 
            0,
          ),
          decoration: BoxDecoration(
            color: isHover ? AppColors.accentHover : AppColors.accent,
            borderRadius: BorderRadius.circular(6.r.clamp(6, 8)),
            boxShadow: isHover
                ? AppColors.hovershadowGlow
                : AppColors.shadowGlow,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6.r.clamp(6, 8)),
              onTap: onPressed,

              // Hover detection
              onHover: (value) => hoverNotifier.value = value,

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 14.h,
                ),

                child: Text(
                  text,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
