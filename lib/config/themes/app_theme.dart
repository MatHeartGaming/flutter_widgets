import 'package:flutter/material.dart';

class AppTheme {
  final List<Color> colorList = [
    Colors.blue,
    Colors.yellow,
    Colors.teal,
    Colors.orange,
    Colors.orangeAccent,
    Colors.red,
    Colors.pink,
    Colors.cyan,
  ];
  final int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor % colorList.length],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        )
      );
}
