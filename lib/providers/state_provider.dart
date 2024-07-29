import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

import 'package:personal_portfolio/config/theme_config.dart';
import 'package:personal_portfolio/preferences/theme_preferences.dart';

class StateProvider extends ChangeNotifier {
  bool _isNavBarOpen = false, _isSplashAnimationDone = false;
  final ThemePreferences themePreferences;

  StateProvider(this.themePreferences) {
    Future.delayed(const Duration(milliseconds: 300), () {
      initCurrentTheme();
    });
  }

  bool get isSplashAnimationDone => _isSplashAnimationDone;
  bool get isNavBarOpen => _isNavBarOpen;

  void initCurrentTheme() async {
    await themePreferences.getThemeFromDb();
    notifyListeners();
  }

  toggleNav() {
    _isNavBarOpen = !_isNavBarOpen;
    notifyListeners();
  }

  setNavAnimationStstus(bool status) {
    _isSplashAnimationDone = status;
    notifyListeners();
  }

  ThemeData get currentTheme {
    return ThemeConfig.allThemes()[themePreferences.currentTheme];
  }
}
