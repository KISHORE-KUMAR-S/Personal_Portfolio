import 'package:flutter/material.dart';

class OutlinedTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double strokeWidth;
  final Color strokeColor;

  const OutlinedTextWidget({
    super.key,
    required this.text,
    required this.style,
    required this.strokeWidth,
    required this.strokeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroke
        Text(
          text,
          style: style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),

        // Fill
        Text(text, style: style)
      ],
    );
  }
}
