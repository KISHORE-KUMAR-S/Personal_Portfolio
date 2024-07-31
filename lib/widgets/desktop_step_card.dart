import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_portfolio/extension/string_extension.dart';
import 'package:personal_portfolio/utils/experience.dart';
import 'package:personal_portfolio/widgets/three_dimension_flip_widget.dart';

class DesktopStepCard extends StatelessWidget {
  final Experience model;
  final Animation<double> animation;
  final double start, end;
  final int index;

  const DesktopStepCard({
    super.key,
    required this.model,
    required this.animation,
    required this.start,
    required this.end,
    required this.index,
  });

  Animation<double> get curvedAnimation => CurvedAnimation(
        parent: animation,
        curve: Interval(
          start,
          end,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = const EdgeInsets.only(left: 30, bottom: 100);

    final DateFormat formatter = DateFormat("MMMM yyyy");
    String startDateFormatted = formatter.format(model.startDate);
    String endDateFormatted = formatter.format(model.endDate);
    String currentDateFormatted = formatter.format(DateTime.now());

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ThreeDimensionFlipWidget(
                animation: curvedAnimation,
                start: start,
                end: end,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: 15,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "$index",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        "$startDateFormatted - ${endDateFormatted == currentDateFormatted ? "Present" : endDateFormatted}",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ThreeDimensionFlipWidget(
            animation: curvedAnimation,
            start: start,
            end: end,
            child: Container(
              width: 1,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ThreeDimensionFlipWidget(
              animation: curvedAnimation,
              start: start,
              end: end,
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.company,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(height: 1.3),
                    ),
                    Text(
                      model.position,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    if (model.type == JobType.remote) const Text("(Remote)"),
                    if (model.type == JobType.intern)
                      const Text("(Internship)"),
                    const SizedBox(height: 30),
                    ...model.responsibilities.map(
                      (e) {
                        return Text(
                          e.prefixDash(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
