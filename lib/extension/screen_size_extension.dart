import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;
}
