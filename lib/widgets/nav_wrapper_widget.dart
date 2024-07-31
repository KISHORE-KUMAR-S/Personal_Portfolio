import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:provider/provider.dart' show Consumer;

import '../extension/color_extension.dart';
import '../providers/state_provider.dart';
import '../router/routes.dart';
import 'nav_drawer_button.dart';
import 'nav_item.dart';

class NavWrapperWidget extends StatefulWidget {
  final Widget child;
  const NavWrapperWidget({super.key, required this.child});

  @override
  State<NavWrapperWidget> createState() => _NavWrapperWidgetState();
}

class _NavWrapperWidgetState extends State<NavWrapperWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.child,
      Positioned.fill(
        child: Consumer<StateProvider>(
          builder: (context, value, child) {
            return Stack(
              children: [
                _buildAnimatedNavBar(context, value),
                _buildTopBar(context),
              ],
            );
          },
        ),
      )
    ]);
  }

  Widget _buildAnimatedNavBar(BuildContext context, StateProvider value) {
    return AnimatedPositioned(
      top: value.isNavBarOpen ? 0 : -MediaQuery.of(context).size.height,
      left: 0,
      right: 0,
      duration: const Duration(milliseconds: 1000),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: RadialGradient(
            center: Alignment.topRight,
            radius: 0.6,
            focal: Alignment.topRight,
            colors: [
              Theme.of(context).colorScheme.secondary.darken(0.4),
              Colors.black
            ],
          ),
        ),
        child: AnimatedOpacity(
          opacity: value.isNavBarOpen ? 1 : 0,
          duration: const Duration(milliseconds: 1500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavItem(context, "Experience", Routes.experience),
              _buildNavItem(context, "Projects", Routes.work),
              _buildNavItem(context, "Contacts", Routes.contact),
              _buildNavItem(context, "About", Routes.about),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            overlayColor:
                WidgetStateProperty.resolveWith((states) => Colors.transparent),
            onTap: () => context.go(Routes.home),
            child: Text.rich(
              TextSpan(
                text: "Kishore Kumar S",
                style: GoogleFonts.bonheurRoyale(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
                children: [
                  TextSpan(
                    text: "ivakumar",
                    style: GoogleFonts.bonheurRoyale(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                ],
              ),
            ),
          ),
          const NavDrawerButton(),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String route) {
    return NavItem(
      title: title,
      onTap: () => context.go(route),
    );
  }
}
