import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class GradientBorderPainter extends CustomPainter {
  final double progress;

  GradientBorderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(12));

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final normalColor = AppColors.border;

    final gradient = AppColors.skillCardGradient;

    if (progress == 0) {
      paint.color = normalColor;
    } else {
      paint.shader = gradient.createShader(rect);
    }

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
