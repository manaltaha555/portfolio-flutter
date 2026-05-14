import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class HoverText extends StatefulWidget {
  const HoverText({
    super.key,
    required this.text,
    required this.textColor,
    this.isSelected = false,
    this.onTap,
  });

  final String text;
  final Color textColor;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        onHover: (value) {
          setState(() => isHover = value);
        },
        mouseCursor: SystemMouseCursors.click,
        splashColor: Colors.transparent, 
        highlightColor: Colors.transparent,

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: textTheme.titleSmall!.copyWith(
              color: isHover || widget.isSelected
                  ? AppColors.accentHover
                  : widget.textColor,
            ),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}