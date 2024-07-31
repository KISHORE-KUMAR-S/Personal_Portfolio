// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors_config.dart';

const bold = FontWeight.w700;
const semiBold = FontWeight.w600;
const medium = FontWeight.w500;
const light = FontWeight.w300;

class ThemeConfig {
  static List<ThemeData> allThemes() {
    final defaultTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: ColorsConfig.white,
      ),
      useMaterial3: true,
      scaffoldBackgroundColor: ColorsConfig.primary,
      textTheme: _buildTextTheme(),
      colorScheme: _buildColorScheme(ColorsConfig.primary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        alignLabelWithHint: true,
      ),
    );

    return [
      defaultTheme,
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xffEF476F)),
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xffEF47D3)),
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xff479FEF)),
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xffCBAC40)),
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xffC4DC66)),
    ];
  }

  static ThemeData modifyColorWithDefaultTheme(ThemeData theme, Color color) {
    return theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(secondary: color),
    );
  }

  static TextTheme _buildTextTheme() {
    return TextTheme(
      headlineLarge: _textStyle(130, FontWeight.normal),
      headlineMedium: _textStyle(80, semiBold),
      headlineSmall: _textStyle(70, bold),
      titleLarge: _textStyle(50, bold),
      titleMedium: _textStyle(40, bold),
      titleSmall: _textStyle(30, bold),
      labelLarge: _textStyle(50, bold),
      labelMedium: _textStyle(30, bold),
      labelSmall: _textStyle(20, FontWeight.normal),
      bodyLarge: _textStyle(20, light),
      bodyMedium: _textStyle(14, light),
      bodySmall: _textStyle(12, medium),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white.withOpacity(0.9),
      decorationColor: Colors.white,
    );
  }

  static TextStyle _textStyle(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.cormorantGaramond(
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static ColorScheme _buildColorScheme(Color primaryColor) {
    return ColorScheme.light(
      primary: primaryColor,
      onPrimary: primaryColor,
      secondary: ColorsConfig.secondary,
      onSecondary: Colors.red,
      error: Colors.red,
      onError: Colors.red,
      surface: primaryColor,
      onSurface: primaryColor,
    );
  }
}
