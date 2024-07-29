import 'package:flutter/material.dart' show BuildContext, MediaQuery;

extension ScreenSizeExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 770;
  bool get isDesktop => MediaQuery.of(this).size.width > 1025;
  bool get isTablet =>
      MediaQuery.of(this).size.width <= 1025 &&
      MediaQuery.of(this).size.width >= 770;

  T getResponsiveValue<T>(List<T> number) {
    assert(number.length == 3);

    if (isMobile) return number[0];
    if (isTablet) return number[1];

    return number[2];
  }
}
