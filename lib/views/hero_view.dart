import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';
import 'package:personal_portfolio/utils/constants.dart';
import 'package:personal_portfolio/widgets/date_and_time_widget.dart';
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
              const DateAndTimeWidget(),
              AnimatedPositioned(
                duration: animationDuration,
                curve: Curves.easeOut,
                right: context.isMobile ? 40 : constraints.maxWidth * 0.1,
                top: _isScrolled ? 300 : 100,
                child: const Opacity(
                  opacity: 0.8,
                  child: OverlappingHeroTextWidget(
                    text: "K",
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
                  text: "E",
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
                  text: "M",
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
                          foregroundStyle: GoogleFonts.imFellFrenchCanonSc(
                            fontSize: _heroTitleFontSize(context),
                          ),
                          backgroundStyle: GoogleFonts.imFellFrenchCanonSc(
                            fontSize: _heroTitleFontSize(context),
                            foreground: Constants.outlinedText(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Entry.opacity(
                        delay: Constants.smallDelay,
                        child: Transform.translate(
                          offset: const Offset(0, -20),
                          child: AutoSizeText(
                            "Kumar",
                            style: GoogleFonts.imFellFrenchCanonSc(
                              height: 0.4,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .fontSize,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Entry.opacity(
                        delay: Constants.smallDelay,
                        duration: Constants.smallDelay,
                        child: Container(
                          width: 500,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text.rich(
                            TextSpan(
                              text:
                                  "Flutter Developer & Open Source Enthusiast",
                              style: TextStyle(
                                fontSize: context.isDesktop ? 16 : 14,
                                fontWeight: FontWeight.w800,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      ", been working as a freelancer and in tech companies for years with a straight focus on the flutter and mobile world. Excited for the upcoming opportunities.",
                                  style: TextStyle(
                                    fontSize: context.isDesktop ? 16 : 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 9,
                            overflow: TextOverflow.ellipsis,
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
      top: 0,
      child: Opacity(
        opacity: 0.6,
        child: Entry.offset(
          yOffset: -1000,
          delay: const Duration(seconds: 4),
          duration: const Duration(seconds: 3),
          child: Container(
            height: 900,
            width: MediaQuery.of(context).size.width + 30,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 0.8,
                stops: const [-5, 1], // Adjusted stops
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
