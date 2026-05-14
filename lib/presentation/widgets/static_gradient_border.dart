import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class StaticGradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rRect = RRect.fromRectAndRadius(
      rect,
      const Radius.circular(12),
    );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..shader = AppColors.skillCardGradient.createShader(rect);

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}