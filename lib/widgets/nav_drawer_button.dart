import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider, Selector;

import 'package:personal_portfolio/providers/state_provider.dart';

class NavDrawerButton extends StatelessWidget {
  const NavDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 300);

    return Selector<StateProvider, bool>(
      selector: (_, provider) => provider.isNavBarOpen,
      builder: (BuildContext context, bool isClicked, Widget? child) {
        return InkWell(
          onTap: Provider.of<StateProvider>(context, listen: false).toggleNav,
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            height: 40,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Stack(
              children: [
                _buildAnimatedLine(isClicked, animationDuration, true),
                _buildAnimatedLine(isClicked, animationDuration, false),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedLine(
    bool isClicked,
    Duration animationDuration,
    bool isTop,
  ) {
    return AnimatedAlign(
      alignment: isClicked
          ? Alignment.center
          : (isTop ? Alignment.topCenter : Alignment.bottomCenter),
      duration: animationDuration,
      child: AnimatedRotation(
        turns: isClicked ? (isTop ? 0.13 : -0.13) : 0,
        duration: animationDuration,
        child: Container(
          width: 40,
          height: 1,
          color: Colors.white,
        ),
      ),
    );
  }
}
