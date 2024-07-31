import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart'
    show VisibilityDetector, VisibilityInfo;

import '../extension/screen_size_extension.dart';
import '../utils/experience.dart';
import 'desktop_step_card.dart';
import 'mobile_step_card.dart';

class JobsListViewWidget extends StatefulWidget {
  const JobsListViewWidget({super.key});

  @override
  State<JobsListViewWidget> createState() => _JobsListViewWidgetState();
}

class _JobsListViewWidgetState extends State<JobsListViewWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller, _textController;
  final Duration duration = const Duration(seconds: 1);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: duration * Experience.ksExperiences.length,
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey('jobs'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.2) {
          _controller.forward();
        }
        if (info.visibleFraction < 0.4 && _controller.isCompleted) {
          _controller.reverse();
        }
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            ...Experience.ksExperiences.map(
              (e) {
                int index = Experience.ksExperiences.indexOf(e);
                double start = index / Experience.ksExperiences.length;
                double end = (index + 1) > Experience.ksExperiences.length
                    ? 10
                    : (index + 1) / Experience.ksExperiences.length;

                return context.getResponsiveValue([
                  MobileStepCard(
                    model: e,
                    animation: _controller,
                    start: start,
                    end: end,
                    index: index + 1,
                  ),
                  MobileStepCard(
                    model: e,
                    animation: _controller,
                    start: start,
                    end: end,
                    index: index + 1,
                  ),
                  DesktopStepCard(
                    model: e,
                    animation: _controller,
                    start: start,
                    end: end,
                    index: index + 1,
                  ),
                ]);
              },
            )
          ],
        ),
      ),
    );
  }
}
