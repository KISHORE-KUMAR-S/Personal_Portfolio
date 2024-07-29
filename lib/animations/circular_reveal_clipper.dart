import 'dart:math' show max, sqrt;

import 'package:flutter/material.dart'
    show Alignment, CustomClipper, Offset, Path, Rect, Size;

class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double? minRadius, maxRadius;

  CircularRevealClipper({
    required this.fraction,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    final Offset center = centerAlignment?.alongSize(size) ??
        centerOffset ??
        Offset(
          size.width / 2,
          size.height / 2,
        );

    final minRadius = this.minRadius ?? 0;
    final maxRadius = this.maxRadius ?? calcMaxRadius(size, center);

    return Path()
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: lerpDouble(
            minRadius,
            maxRadius,
            fraction,
          ),
        ),
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

  double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);

    return sqrt(w * w + h * h);
  }

  lerpDouble(double minRadius, double maxRadius, double fraction) {
    return minRadius * (1.0 - fraction) + maxRadius * fraction;
  }
}
