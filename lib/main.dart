// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:provider/provider.dart' show ChangeNotifierProvider, Consumer;

import 'preferences/theme_preferences.dart';
import 'providers/state_provider.dart';
import 'router/router.dart';
import 'widgets/cursor_widget.dart';

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
              title: "Kishore Kumar Sivakumar",
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
