import 'package:flutter/material.dart' show Color, HSLColor;

extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    return HSLColor.fromColor(this)
        .withLightness(
            (HSLColor.fromColor(this).lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }
}
