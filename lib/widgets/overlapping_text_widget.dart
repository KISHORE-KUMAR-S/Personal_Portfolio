import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';

class OverlappingTextWidget extends StatelessWidget {
  final Offset offset;
  final String text;
  final TextStyle? backgroundStyle, foregroundStyle;
  final String? backgroundText;

  const OverlappingTextWidget({
    super.key,
    this.offset = const Offset(-10, 10),
    required this.text,
    this.backgroundStyle,
    this.foregroundStyle,
    this.backgroundText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = theme.textTheme.headlineLarge?.copyWith(fontSize: 120);
    final backgroundTextStyle = backgroundStyle ??
        defaultStyle?.copyWith(color: theme.colorScheme.secondary);

    return Stack(
      fit: StackFit.passthrough,
      children: [
        Entry.all(
          xOffset: -offset.dx,
          yOffset: -offset.dy,
          opacity: 0,
          scale: 1,
          delay: const Duration(seconds: 4),
          child: Transform.translate(
            offset: offset,
            child: AutoSizeText(
              backgroundText ?? text,
              style: backgroundTextStyle,
              maxLines: 1,
            ),
          ),
        ),
        AutoSizeText(
          text,
          style: foregroundStyle ?? defaultStyle,
          maxLines: 1,
        ),
      ],
    );
  }
}
