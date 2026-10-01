import 'package:flutter/material.dart';

class AppTheme {
  // 1. Brand colors
  static const Color primaryColor = Color.fromARGB(255, 147, 215, 70); // Restaurant Warm Red
  static const Color surfaceColor = Color.fromARGB(255, 205, 243, 211);

  // 2. Material 3 ThemeData
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 234, 233, 231),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      surface: surfaceColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
