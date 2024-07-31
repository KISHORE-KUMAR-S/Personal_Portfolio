import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/widgets/jobs_list_view_widget.dart';
import 'package:personal_portfolio/widgets/section_title.dart';
import 'package:personal_portfolio/widgets/slide_box_widget.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          const SectionTitle(
            backgroundText: "JOURNEY",
            foregroundText: "WORK EXPERIENCE",
          ),
          const SizedBox(height: 100),
          Align(
            alignment: Alignment.bottomCenter,
            child: Entry.opacity(
              opacity: 0,
              duration: const Duration(milliseconds: 1500),
              child: SlideBoxWidget(
                controller: _controller,
                height: MediaQuery.of(context).size.height * 0.4,
                width: 6,
                boxColor: Colors.white,
                coverColor: Theme.of(context).colorScheme.primary,
                isVertical: true,
              ),
            ),
          ),
          const SizedBox(height: 70),
          const JobsListViewWidget(),
        ],
      ),
    );
  }
}
