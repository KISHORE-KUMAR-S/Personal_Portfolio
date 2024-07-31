import 'package:flutter/material.dart';
import '../extension/string_extension.dart';
import 'mobile_step_card.dart';

import 'three_dimension_flip_widget.dart';

class DesktopStepCard<T> extends StatelessWidget {
  final T model;
  final Animation<double> animation;
  final double start, end;
  final int index;
  final String Function(T) getTitle;
  final String Function(T) getSubtitle;
  final StringFormatter formatDate;
  final StringListMapper getResponsibilities;
  final AssetImage image;

  const DesktopStepCard({
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
    required this.image,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "$index",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w200,
                                    ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            getSubtitle(model),
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w200,
                                    ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageIcon(
                            image,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 200,
                          ),
                        ],
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
                      getTitle(model),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(height: 1.3),
                    ),
                    const SizedBox(height: 30),
                    ...getResponsibilities(model).map(
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
