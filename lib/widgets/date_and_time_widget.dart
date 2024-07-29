import 'dart:async' show Timer;

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_portfolio/extension/screen_size_extension.dart';
import 'package:personal_portfolio/utils/constants.dart';

class DateAndTimeWidget extends StatefulWidget {
  const DateAndTimeWidget({super.key});

  @override
  State<DateAndTimeWidget> createState() => _DateAndTimeWidgetState();
}

class _DateAndTimeWidgetState extends State<DateAndTimeWidget> {
  late final Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() => _now = DateTime.now());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.isMobile ? 20 : 40,
      left: 0,
      right: 0,
      child: Entry.opacity(
        delay: Constants.smallDelay,
        duration: Constants.smallDelay,
        curve: Curves.ease,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!context.isMobile) ...[
              _buildFlipCounter(int.parse(DateFormat('dd').format(_now))),
              _textDivider(" - "),
              _buildFlipCounter(int.parse(DateFormat('MM').format(_now))),
              _textDivider(" - "),
              _buildFlipCounter(int.parse(DateFormat('yyyy').format(_now))),
              const SizedBox(width: 20),
              _buildFlipCounter(int.parse(DateFormat('hh').format(_now))),
              _textDivider(" : "),
              _buildFlipCounter(_now.minute),
              _textDivider(" : "),
              _buildFlipCounter(_now.second),
              _textDivider("  ${DateFormat('a').format(_now)}"),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildFlipCounter(value) {
    return AnimatedFlipCounter(
      value: value,
      textStyle: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontSize: context.isMobile ? 12 : null),
    );
  }

  Widget _textDivider(value) {
    return Text(
      value,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontSize: context.isMobile ? 12 : null),
    );
  }
}
