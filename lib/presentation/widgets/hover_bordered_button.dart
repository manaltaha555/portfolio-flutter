import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class HoverBorderedButton extends StatefulWidget {
  const HoverBorderedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  State<HoverBorderedButton> createState() => _HoverBorderedButtonState();
}

class _HoverBorderedButtonState extends State<HoverBorderedButton> {
  final ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ValueListenableBuilder<bool>(
      valueListenable: isHover,
      builder: (context, hover, child) {
        return InkWell(
          borderRadius: BorderRadius.circular(6.r.clamp(6, 8)),
          onTap: widget.onPressed,

          onHover: (value) => isHover.value = value,

          child: AnimatedContainer(
            transform: Matrix4.translationValues(0, hover ? -3 : 0, 0),
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeIn,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: hover ? AppColors.accentHover : Colors.transparent,
              boxShadow: hover ? AppColors.shadowGlow : null,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.accent, width: 1.5),
            ),
            child: TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                begin: AppColors.accentHover,
                end: hover ? AppColors.textPrimary : AppColors.accentHover,
              ),
              duration: const Duration(milliseconds: 150),
              builder: (context, color, child) {
                return Text(
                  widget.text,
                  style: textTheme.headlineSmall!.copyWith(color: color),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
