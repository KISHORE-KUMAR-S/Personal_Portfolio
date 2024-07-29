// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:provider/provider.dart' show ChangeNotifierProvider, Consumer;

import 'package:personal_portfolio/preferences/theme_preferences.dart';
import 'package:personal_portfolio/providers/state_provider.dart';
import 'package:personal_portfolio/router/router.dart';
import 'package:personal_portfolio/widgets/cursor_widget.dart';

void main() {
  final ThemePreferences themePreferences = ThemePreferences(0);
  usePathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => StateProvider(themePreferences),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (context, value, child) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: CursorWidget(
            child: MaterialApp.router(
              title: "Kishore Kumar Sivakumar's Portfolio",
              debugShowCheckedModeBanner: false,
              theme: value.currentTheme,
              routerConfig: router,
            ),
          ),
        );
      },
    );
  }
}
