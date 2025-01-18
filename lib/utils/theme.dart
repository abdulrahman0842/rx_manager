import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal, secondary: Colors.tealAccent),
  primaryColor: Color(0xFF009688), // Teal
  primaryColorDark: Color(0xFF00796B), // Dark Teal
  // accentColor: Color(0xFF80CBC4), // Light Teal
  scaffoldBackgroundColor: Color(0xFFF5F5F5), // Light Grey
  // errorColor: Color(0xFFD32F2F), // Red
  textTheme: TextTheme(
    headlineMedium: TextStyle(
        color: Color(0xFF212121),
        fontSize: 24,
        fontWeight: FontWeight.bold), // Dark Grey
    bodyMedium:
        TextStyle(color: Color(0xFF757575), fontSize: 16), // Medium Grey
  ),
  appBarTheme: AppBarTheme(
    color: Color(0xFF009688), // Teal
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF009688), // Teal
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);

const Color primaryColor = Color(0xFF009688); // Teal
const Color secondaryColor = Color(0xFF80CBC4); // Light Teal

const Color buttonHighlightColor = Color.fromARGB(255, 42, 190, 176);
const Color backgroundColor = Color(0xFFF5F5F5); // Light Grey
const Color cardColor = Colors.white;
