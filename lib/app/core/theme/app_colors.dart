import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get instance {
    _instance ??= AppColors._();

    return _instance!;
  }

  Color get primary => const Color(0xFF0067B1);
  Color get primaryLight => const Color(0xFF219FFF);
  Color get black => const Color(0xFF140E0E);
}
