import 'package:flutter/material.dart';
import 'package:test_project/feature/validators_page/presentation/screens/validators_page.dart';

import '../../../countdown_page/presentation/screens/countdown_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ListItem> items = [
    ListItem(
      title: 'Countdown timer',
      onTap: (_) => Navigator.push(
        _,
        MaterialPageRoute(
          builder: (context) => const CountdownPage(),
        ),
      ),
    ),
    ListItem(
      title: 'Validators',
      onTap: (_) => Navigator.push(
        _,
        MaterialPageRoute(
          builder: (context) => const ValidatorsPage(),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home page'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, index) {
          final item = items[index];
          return ListTile(
            title: Center(child: Text(item.title)),
            tileColor: Colors.cyan,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            onTap: () => item.onTap(context),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: items.length,
      ),
    );
  }
}

class ListItem {
  final String title;
  final Function(BuildContext) onTap;

  ListItem({required this.title, required this.onTap});
}
