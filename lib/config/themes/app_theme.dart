import 'package:flutter/material.dart';

class AppTheme {
  static final List<Color> colorList = [
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
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor % colorList.length],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ));
}
