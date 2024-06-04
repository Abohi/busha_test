import 'package:busha_mobile_test/presentations/custom_designs/gradient_circular_progress_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GradientCircularProgressIndicator extends HookWidget {
  final double value;
  final double size;
  final double strokeWidth;

  GradientCircularProgressIndicator({
    required this.value,
    this.size = 50.0,
    this.strokeWidth = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 0.0,
      upperBound: 1.0,
    );

    useEffect(() {
      animationController.repeat();
      return () {
        animationController.dispose();
      };
    }, []);

    return Container(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return CustomPaint(
            painter: GradientCircularProgressPainter(
              progress: value,
              strokeWidth: strokeWidth,
              animation: animationController,
            ),
          );
        },
      ),
    );
  }
}
