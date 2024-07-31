import 'package:flutter/material.dart';

class HorizontalStickWidget extends AnimatedWidget {
  final Animation<double> controller;
  final double height;

  const HorizontalStickWidget({
    required this.controller,
    this.height = 2,
    super.key,
  }) : super(listenable: controller);

  Animation<double> get width => Tween<double>(begin: 0, end: 100).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width.value,
      color: Colors.white,
    );
  }
}
