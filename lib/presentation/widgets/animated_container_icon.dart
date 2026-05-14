import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class AnimatedContainerIcon extends StatelessWidget {
  AnimatedContainerIcon({super.key, required this.icon, required this.onTap});
  final hoverNotifier = ValueNotifier(false);
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hoverNotifier,
      builder: (context, isHover, child) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: onTap,
          onHover: (value) {
            hoverNotifier.value = value;
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 35,
            height: 35,
            alignment: AlignmentGeometry.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isHover
                  ? AppColors.bgGlass.withAlpha(80)
                  : AppColors.bgGlass.withAlpha(50),
              border: Border.all(color: AppColors.bgGlass),
            ),
            child: Icon(icon, color: AppColors.textPrimary),
          ),
        );
      },
    );
  }
}
