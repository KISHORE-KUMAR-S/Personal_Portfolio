import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:personal_portfolio/extension/string_extension.dart';
import 'package:personal_portfolio/widgets/horizontal_stick_widget.dart';
import 'package:personal_portfolio/widgets/three_dimension_flip_widget.dart';

typedef StringFormatter = String Function(DateTime date);
typedef StringListMapper = List<String> Function(dynamic item);

class MobileStepCard<T> extends StatelessWidget {
  final T model;
  final Animation<double> animation;
  final double start, end;
  final int index;
  final String Function(T) getTitle;
  final String Function(T) getSubtitle;
  final StringFormatter formatDate;
  final StringListMapper getResponsibilities;

  const MobileStepCard({
    super.key,
    required this.model,
    required this.animation,
    required this.start,
    required this.end,
    required this.index,
    required this.getTitle,
    required this.getSubtitle,
    required this.formatDate,
    required this.getResponsibilities,
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
    final DateFormat formatter = DateFormat("MMMM yyyy");
    formatter.format(DateTime.now());

    EdgeInsetsGeometry padding = const EdgeInsets.all(10);

    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ThreeDimensionFlipWidget(
                animation: curvedAnimation,
                start: start,
                end: end,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$index",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w200, fontSize: 14),
                    ),
                    const SizedBox(width: 30),
                    Text(
                      getSubtitle(model),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w200, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            HorizontalStickWidget(controller: curvedAnimation),
            const SizedBox(height: 10),
            ThreeDimensionFlipWidget(
              animation: curvedAnimation,
              start: start,
              end: end,
              child: Padding(
                padding: padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTitle(model),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(height: 1.2),
                    ),
                    ...getResponsibilities(model).map(
                      (e) => Text(
                        e.prefixDash(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
