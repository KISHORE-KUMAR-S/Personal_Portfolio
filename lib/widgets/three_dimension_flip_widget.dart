import 'package:flutter/material.dart';

class ThreeDimensionFlipWidget extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;
  final double start, end;

  const ThreeDimensionFlipWidget({
    super.key,
    required this.animation,
    required this.child,
    required this.start,
    required this.end,
  }) : super(listenable: animation);

  Animation<double> get transformAnimation =>
      Tween<double>(begin: 1.5, end: 0).animate(animation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateX(transformAnimation.value),
        child: child,
      ),
    );
  }
}
