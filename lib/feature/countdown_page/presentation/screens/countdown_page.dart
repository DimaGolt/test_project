import 'package:flutter/material.dart';

import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:test_project/feature/countdown_page/presentation/widgets/countdown_widget.dart';

class CountdownPage extends StatelessWidget {
  const CountdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime endTime = DateTime.now()
        .add(const Duration(minutes: 2));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Countdown'),
      ),
      body: Column(
        children: [
          CountdownTimer(
            endTime: endTime
                .millisecondsSinceEpoch,
          ),
          const Text('Countdown'),
          CountdownWidget(endTime: endTime
              .millisecondsSinceEpoch),
        ],
      ),
    );
  }
}
