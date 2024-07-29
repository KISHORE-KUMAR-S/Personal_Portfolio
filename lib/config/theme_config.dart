import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/config/colors_config.dart';

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
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.alegreya(
          fontSize: 127,
          fontWeight: FontWeight.normal,
        ),
        headlineMedium: GoogleFonts.alegreya(
          fontSize: 70,
          fontWeight: semiBold,
        ),
        headlineSmall: GoogleFonts.alegreya(fontSize: 60, fontWeight: bold),
        titleLarge: GoogleFonts.alegreya(fontSize: 48, fontWeight: bold),
        titleMedium: GoogleFonts.alegreya(fontSize: 38, fontWeight: bold),
        titleSmall: GoogleFonts.alegreya(fontSize: 26, fontWeight: bold),
        labelLarge: GoogleFonts.alegreya(fontSize: 48, fontWeight: bold),
        labelMedium: GoogleFonts.alegreya(fontSize: 25, fontWeight: bold),
        labelSmall: GoogleFonts.alegreya(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: GoogleFonts.alegreya(fontSize: 16, fontWeight: light),
        bodyMedium: GoogleFonts.alegreya(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        bodySmall: GoogleFonts.alegreya(fontSize: 10, fontWeight: medium),
      ).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white.withOpacity(0.9),
        decorationColor: Colors.white,
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ColorsConfig.primary,
        onPrimary: ColorsConfig.primary,
        secondary: ColorsConfig.secondary,
        onSecondary: Colors.red,
        error: Colors.red,
        onError: Colors.red,
        surface: ColorsConfig.primary,
        onSurface: ColorsConfig.primary,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        alignLabelWithHint: true,
      ),
    );

    return [
      defaultTheme,
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xffEF476F)),
      modifyColorWithDefaultTheme(
          defaultTheme, const Color.fromARGB(255, 239, 71, 211)),
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xff479FEF)),
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xffCBAC40)),
      modifyColorWithDefaultTheme(defaultTheme, const Color(0xffc4dc662)),
    ];
  }

  static modifyColorWithDefaultTheme(ThemeData theme, Color color) {
    return theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: color));
  }
}
