import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
);