import 'package:flutter/material.dart';

const double hiddenFactor = 2.0;

class SlideBoxWidget extends AnimatedWidget {
  final bool isVertical;
  final AnimationController controller;
  final double height, width;
  final Color boxColor, coverColor;
  final Curve visibleBoxCurve, invisibleBoxCurve;
  final Animation<double>? visibleBoxAnimation, invisibleBoxAnimation;

  const SlideBoxWidget({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.boxColor = Colors.black,
    this.coverColor = Colors.transparent,
    this.isVertical = false,
    this.visibleBoxCurve = Curves.fastOutSlowIn,
    this.invisibleBoxCurve = Curves.fastOutSlowIn,
  }) : super(listenable: controller);

  Animation<double> get visibleAnimation =>
      visibleBoxAnimation ??
      Tween<double>(
              begin: 0, end: isVertical ? height : width - (hiddenFactor * 2))
          .animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0, 0.5, curve: visibleBoxCurve),
        ),
      );

  Animation<double> get invisibleAnimation =>
      Tween<double>(begin: 0, end: isVertical ? height : width).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.5,
            1.0,
            curve: invisibleBoxCurve,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: hiddenFactor,
            left: hiddenFactor,
            child: Container(
              width: isVertical
                  ? width - (hiddenFactor * 2)
                  : visibleAnimation.value,
              height: isVertical
                  ? visibleAnimation.value
                  : height - (hiddenFactor * 2),
              color: boxColor,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: isVertical ? width : invisibleAnimation.value,
              height: isVertical ? invisibleAnimation.value : height,
              color: coverColor,
            ),
          )
        ],
      ),
    );
  }
}
