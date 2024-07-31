import 'package:flutter/material.dart';
import 'package:personal_portfolio/utils/experience.dart';

class MobileStepCard extends StatelessWidget {
  final Experience experience;
  final Animation<double> animation;
  final double start, end;
  final int index;

  const MobileStepCard({
    super.key,
    required this.experience,
    required this.animation,
    required this.start,
    required this.end,
    required this.index,
  });

  Animation<double> get curvedAnimation => CurvedAnimation(
      parent: animation,
      curve: Interval(
        start,
        end,
        curve: Curves.easeInOut,
      ));

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
