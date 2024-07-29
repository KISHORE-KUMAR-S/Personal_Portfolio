import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';

class OverlappingHeroTextWidget extends StatelessWidget {
  final Offset offset;
  final String text;
  final TextStyle? backgroundStyle;
  final String? backgroundText;
  final double initialXOffset;
  final double initialYOffset;

  const OverlappingHeroTextWidget({
    super.key,
    this.offset = const Offset(-10, 15),
    required this.text,
    this.backgroundStyle,
    this.backgroundText,
    required this.initialXOffset,
    required this.initialYOffset,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fontSize = context.getResponsiveValue([40, 80, 120]).toDouble();
    final defaultBackgroundStyle = theme.textTheme.headlineLarge?.copyWith(
      color: theme.colorScheme.secondary,
      fontSize: fontSize,
    );
    final defaultForegroundStyle = theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

    return Entry.all(
      xOffset: 400,
      yOffset: 300,
      opacity: 0,
      scale: 1,
      curve: Curves.ease,
      delay: const Duration(seconds: 1),
      duration: const Duration(seconds: 2),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Entry.all(
            xOffset: initialXOffset,
            yOffset: initialYOffset,
            opacity: 0,
            scale: 1,
            delay: const Duration(seconds: 1),
            duration: const Duration(milliseconds: 2500),
            curve: Curves.easeOut,
            child: Transform.translate(
              offset: offset,
              child: Text(
                backgroundText ?? text,
                style: backgroundStyle ?? defaultBackgroundStyle,
              ),
            ),
          ),
          Text(
            text,
            style: defaultForegroundStyle,
          ),
        ],
      ),
    );
  }
}
