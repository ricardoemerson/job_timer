import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static const MaterialColor _primarySwatch = MaterialColor(0xFF0066B0, {
    50: Color(0xFF005c9e),
    100: Color(0xFF00528d),
    200: Color(0xFF00477b),
    300: Color(0xFF003d6a),
    400: Color(0xFF003358),
    500: Color(0xFF002946),
    600: Color(0xFF001f35),
    700: Color(0xFF001423),
    800: Color(0xFF000a12),
    900: Color(0xFF000000),
  });

  static final theme = ThemeData(
    primaryColor: const Color(0xFF0066B0),
    primaryColorLight: const Color(0xFF219FFF),
    primarySwatch: _primarySwatch,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      // isDense: true,
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.only(top: 15, left: 17, right: 17),
      border: defaultInputBorder,
      enabledBorder: defaultInputBorder,
      focusedBorder: defaultInputBorder,
      errorBorder: defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      labelStyle: const TextStyle(color: Colors.black),
      errorStyle: const TextStyle(color: Colors.redAccent),
    ),
  );
}
