import 'package:flutter/material.dart';
import 'circular_reveal_clipper.dart';

class CircularRevealAnimation extends StatelessWidget {
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double? minRadius, maxRadius;
  final Widget child;
  final Animation<double> animation;

  const CircularRevealAnimation({
    super.key,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
    required this.child,
    required this.animation,
  }) : assert(centerAlignment == null || centerOffset == null);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value,
            centerAlignment: centerAlignment,
            centerOffset: centerOffset,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
