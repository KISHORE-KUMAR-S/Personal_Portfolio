import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio/config/colors_config.dart';
import '../extension/screen_size_extension.dart';
import '../utils/constants.dart';
import 'overlapping_hero_text_widget.dart';

class ProcessCard extends StatelessWidget {
  final bool isReversed;
  final String number, title, description;

  const ProcessCard({
    super.key,
    required this.isReversed,
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final children = context.isMobile
        ? [
            Entry.opacity(
              duration: Constants.smallDelay,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Entry.opacity(
                    duration: Constants.smallDelay,
                    delay: Constants.smallDelay,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        child: OverlappingHeroTextWidget(
                          text: number,
                          backgroundStyle: GoogleFonts.bonheurRoyale(
                            fontSize: 80,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          foregroundStyle: GoogleFonts.bonheurRoyale(
                            fontSize: 80,
                          ),
                          backgroundText: number,
                        ),
                      ),
                    ),
                  ),
                  AutoSizeText(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 38),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(height: 1.6),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.15),
                    height: 100,
                  )
                ],
              ),
            ),
          ]
        : [
            Expanded(
              flex: 2,
              child: Entry.opacity(
                duration: Constants.smallDelay,
                delay: Constants.smallDelay,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 48,
                          ),
                    ),
                    Text(
                      description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 1.6),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.15),
                      height: 200,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Entry.opacity(
                duration: Constants.smallDelay,
                delay: Constants.smallDelay,
                child: Container(
                  height: 140,
                  alignment:
                      isReversed ? Alignment.centerLeft : Alignment.centerRight,
                  child: OverlappingHeroTextWidget(
                    text: number,
                    backgroundStyle: GoogleFonts.bonheurRoyale(
                      fontSize: 100,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    foregroundStyle: GoogleFonts.bonheurRoyale(
                      fontSize: 100,
                    ),
                    backgroundText: number,
                    offset: const Offset(-20, 10),
                  ),
                ),
              ),
            )
          ];

    return Entry.opacity(
      duration: Constants.smallDelay,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1600),
        padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 100),
        child: context.isMobile
            ? LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    constraints: constraints,
                    alignment: Alignment.center,
                    child: Column(children: children),
                  );
                },
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: isReversed ? children.reversed.toList() : children,
              ),
      ),
    );
  }
}
