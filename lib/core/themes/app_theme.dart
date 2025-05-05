import 'package:flutter/material.dart';
import 'package:neuricax/core/constants/color_constants.dart';

ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  hintColor: accentColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0,
    foregroundColor: primaryColor,
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  hintColor: accentColor,
  appBarTheme: AppBarTheme(
    elevation: 0,
    foregroundColor: primaryColor,
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
);
