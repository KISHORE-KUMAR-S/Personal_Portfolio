import 'package:flutter/material.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';
import 'package:personal_portfolio/utils/experience.dart';
import 'package:visibility_detector/visibility_detector.dart';

class JobListViewWidget extends StatefulWidget {
  const JobListViewWidget({super.key});

  @override
  State<JobListViewWidget> createState() => _JobListViewWidgetState();
}

class _JobListViewWidgetState extends State<JobListViewWidget>
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

                  return context.getResponsiveValue([]);
                },
              )
            ],
          ),
        ),
        onVisibilityChanged: onVisibilityChanged);
  }
}
