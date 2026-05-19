import 'package:flutter/material.dart';

class DotPatternPainter extends CustomPainter {
  final Color color;
  final double spacing;
  final double radius;

  DotPatternPainter({
    required this.color,
    this.spacing = 16.0,
    this.radius = 1.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DotPatternBackground extends StatelessWidget {
  final Widget child;

  const DotPatternBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DotPatternPainter(
        color: Colors.black.withValues(alpha: 0.15),
        spacing: 14.0,
        radius: 1.5,
      ),
      child: child,
    );
  }
}
