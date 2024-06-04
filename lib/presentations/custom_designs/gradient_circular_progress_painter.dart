import 'dart:math' as math;

import 'package:flutter/material.dart';

class GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Animation<double> animation;

  GradientCircularProgressPainter({
    required this.progress,
    this.strokeWidth = 8.0,
    required this.animation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    final gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + 2 * math.pi,
      colors: [
        Color(0xFF12A633), // Start at 100% green
        Color(0xFFFFFFFF), // Transition to white
        Color(0xFFFFFFFF), // Transition to white
        Color(0xFF12A633), // End at green
      ],
      stops: [
        0.0, // At 0% progress
        progress, // At the current progress value
        progress, // Continue from the current progress value
        1.0, // At 100% progress
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle + animation.value * 2 * math.pi, sweepAngle,
        false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
