import 'dart:async';

import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final int endTime;

  const CountdownWidget({super.key, required this.endTime});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int get endTime => widget.endTime;

  final interval = const Duration(seconds: 1);

  late int timerMaxSeconds = (endTime / 1000) as int;
  late Duration currentTime = Duration(seconds: timerMaxSeconds);
  late Timer timer;

  String get timerText =>
      '${currentTime.inHours.toString().padLeft(2, '0')}: ${(currentTime.inMinutes % 60).toString().padLeft(2, '0')}: ${(currentTime.inSeconds % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentTime = Duration(seconds: timerMaxSeconds - timer.tick);
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    timerMaxSeconds = DateTime.fromMillisecondsSinceEpoch(endTime).difference(DateTime.now()).inSeconds;
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(timerText);
  }
}
