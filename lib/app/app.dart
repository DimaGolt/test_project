import 'package:flutter/material.dart';
import 'package:test_project/app/theme.dart';

import '../feature/home_page/presentation/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: MyHomePage(),
    );
  }
}
