import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:provider/provider.dart';

import '../providers/state_provider.dart';
import '../utils/constants.dart';
import 'outlined_text_widget.dart';

class NavItem extends StatefulWidget {
  final String title;
  final void Function() onTap;

  const NavItem({super.key, required this.title, required this.onTap});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            _buildHorizontalLine(context),
            _buildAnimatedTitle(context),
            _buildInteractiveRegion(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalLine(BuildContext context) {
    return AnimatedPositioned(
      duration: Constants.mediumAnimationSpeed,
      curve: Curves.ease,
      top: 0,
      bottom: 0,
      left: isHovered ? 0 : -MediaQuery.of(context).size.width * 0.4 - 30,
      child: Center(
        child: Transform.translate(
          offset: const Offset(0, -5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 0.8,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedTitle(BuildContext context) {
    return AnimatedPositioned(
      left: isHovered ? -40 : 0,
      right: 0,
      top: isHovered ? -10 : 0,
      curve: Curves.ease,
      duration: Constants.mediumAnimationSpeed,
      child: AnimatedOpacity(
        opacity: isHovered ? 1 : 0,
        duration: Constants.mediumAnimationSpeed,
        child: Center(
          child: OutlinedTextWidget(
            text: widget.title,
            style: GoogleFonts.laBelleAurore(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              foreground: Constants.outlinedText(
                context,
                strokeWidth: 0.001,
              ),
            ),
            strokeWidth: 0.001,
            strokeColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  Widget _buildInteractiveRegion(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.read<StateProvider>().toggleNav();
          widget.onTap();
        },
        child: Text(
          widget.title,
          style: GoogleFonts.laBelleAurore(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          ),
        ),
      ),
    );
  }
}
