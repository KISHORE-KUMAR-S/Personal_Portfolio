import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Consumer;

import 'package:personal_portfolio/providers/state_provider.dart';
import 'package:personal_portfolio/screens/splash_page.dart';
import 'package:personal_portfolio/views/hero_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
      builder: (BuildContext context, StateProvider value, Widget? child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: !value.isSplashAnimationDone
              ? const SplashPage(key: ValueKey(0))
              : Scaffold(
                  body: Stack(
                    children: [
                      ListView(
                        controller: _scrollController,
                        physics: value.isNavBarOpen
                            ? const NeverScrollableScrollPhysics()
                            : null,
                        children: [
                          HeroView(scrollController: _scrollController),
                          // ExperienceView(),
                          // RecentWorksView(),
                          // ProjectProcessView(),
                          // ContactView(),
                          // FooterView(),
                        ],
                      ),
                      // ThemeSwitcher(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
