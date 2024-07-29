import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';
import 'package:personal_portfolio/utils/constants.dart';
import 'package:personal_portfolio/widgets/nav_wrapper_widget.dart';
import 'package:personal_portfolio/widgets/overlapping_hero_text_widget.dart';
import 'package:personal_portfolio/widgets/overlapping_text_widget.dart';

class HeroView extends StatefulWidget {
  final ScrollController scrollController;

  const HeroView({super.key, required this.scrollController});

  @override
  State<HeroView> createState() => _HeroViewState();
}

class _HeroViewState extends State<HeroView> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Duration animationDuration = Duration(milliseconds: 200);
    return NavWrapperWidget(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              _backgroundGradient(context),
              AnimatedPositioned(
                duration: animationDuration,
                curve: Curves.easeOut,
                right: context.isMobile ? 40 : constraints.maxWidth * 0.1,
                top: _isScrolled ? 300 : 100,
                child: const Opacity(
                  opacity: 0.8,
                  child: OverlappingHeroTextWidget(
                    text: "KK.",
                    initialXOffset: 200,
                    initialYOffset: 200,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: animationDuration,
                curve: Curves.easeOut,
                bottom: _isScrolled ? -100 : -50,
                right: constraints.maxWidth * 0.2,
                child: const OverlappingHeroTextWidget(
                  text: "KK.",
                  initialXOffset: -200,
                  initialYOffset: 200,
                ),
              ),
              AnimatedPositioned(
                left: context.isMobile ? 20 : 150,
                duration: animationDuration,
                curve: Curves.easeOut,
                bottom: _isScrolled
                    ? 300
                    : context.isMobile
                        ? 300
                        : 150,
                child: const OverlappingHeroTextWidget(
                  text: "KK.",
                  initialXOffset: -200,
                  initialYOffset: 200,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Entry.opacity(
                        child: OverlappingTextWidget(
                          text: 'Kishore',
                          offset: Offset(
                            -_heroTitleFontSize(context) / 3,
                            -_heroTitleFontSize(context) / 3,
                          ),
                          foregroundStyle: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                fontSize: _heroTitleFontSize(context),
                              ),
                          backgroundStyle: GoogleFonts.bonheurRoyale(
                            fontSize: _heroTitleFontSize(context),
                            foreground: Constants.outlinedText(context),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    ));
  }

  void _scrollListener() {
    if (widget.scrollController.offset >= 200 && _isScrolled == false) {
      setState(() => _isScrolled = true);
    } else if (widget.scrollController.offset <= 200 && _isScrolled == true) {
      setState(() => _isScrolled = false);
    }
  }

  Widget _backgroundGradient(BuildContext context) {
    return Positioned(
      top: context.isMobile ? -40 : 250,
      child: Opacity(
        opacity: 0.6,
        child: Entry.offset(
          yOffset: -500,
          delay: const Duration(seconds: 4),
          duration: const Duration(seconds: 3),
          child: Container(
            height: 900,
            width: MediaQuery.of(context).size.width + 30,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 0.8,
                stops: const [-2, -1],
                colors: [
                  Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                  Theme.of(context).scaffoldBackgroundColor,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _heroTitleFontSize(BuildContext context) {
    return (context.isTablet)
        ? 100
        : (context.isMobile)
            ? 80
            : 127;
  }
}
