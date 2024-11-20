
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColorLight = Colors.blue;
  static const Color accentColorLight = Colors.green;

  static const Color primaryColorDark = Colors.deepPurple;
  static const Color accentColorDark = Colors.amber;

  static const TextStyle headline1Light = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText1Light = TextStyle(
    fontSize: 16,
  );

  static const TextStyle headline1Dark = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle bodyText1Dark = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColorLight,
    textTheme: const TextTheme(
      displayLarge: headline1Light,
      bodyLarge: bodyText1Light,
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColorLight),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColorDark,
    textTheme: const TextTheme(
      displayLarge: headline1Dark,
      bodyLarge: bodyText1Dark,
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColorDark),
  );
}
