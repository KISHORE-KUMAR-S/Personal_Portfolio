import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:entry/entry.dart' show Entry;
import 'package:flutter/material.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';
import 'package:personal_portfolio/utils/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionTitle extends StatefulWidget {
  final String backgroundText, foregroundText;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.backgroundText,
    required this.foregroundText,
    this.subtitle,
  });

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle>
    with TickerProviderStateMixin {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Entry.opacity(
          duration: Constants.smallDelay,
          child: Column(
            children: [
              Stack(
                children: [
                  Entry.all(
                    opacity: 0,
                    scale: 1,
                    xOffset: 60,
                    yOffset: 50,
                    duration: const Duration(seconds: 2),
                    delay: const Duration(seconds: 2),
                    child: Transform.translate(
                      offset: context.getResponsiveValue(
                        [
                          const Offset(0, -30),
                          const Offset(-70, -40),
                          const Offset(-70, -50),
                        ],
                      ),
                      child: AutoSizeText(
                        widget.backgroundText,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                              fontSize: context
                                  .getResponsiveValue([60, 80, 100]).toDouble(),
                              height: 0.9,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color =
                                    Theme.of(context).colorScheme.secondary,
                            ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  AutoSizeText(
                    widget.foregroundText,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: context
                              .getResponsiveValue([40, 50, 60]).toDouble(),
                          height: 1,
                        ),
                    maxLines: 2,
                  ),
                ],
              ),
              VisibilityDetector(
                key: ValueKey(widget.subtitle),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: context.isMobile ? 300 : 400,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeOutCirc,
                              height: 1,
                              width: isVisible ? 400 : 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        if (widget.subtitle != null)
                          AnimatedOpacity(
                            opacity: isVisible ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: AnimatedSlide(
                              offset: isVisible
                                  ? const Offset(0, 0)
                                  : const Offset(2, 0),
                              duration: const Duration(milliseconds: 500),
                              child: Text(widget.subtitle!),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction == 1 &&
                      isVisible == false &&
                      mounted) {
                    setState(() => isVisible = true);
                  } else if (info.visibleFraction == 0 && mounted) {
                    setState(() => isVisible = false);
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
