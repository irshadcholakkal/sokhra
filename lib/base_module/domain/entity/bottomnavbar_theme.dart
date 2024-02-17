import 'package:flutter/material.dart';

class BottomNavBarTheme {
  static BottomNavigationBarThemeData bottomNavBarThemeDark() {
    return const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  static BottomNavigationBarThemeData bottomNavBarThemeLight() {
    return bottomNavBarThemeDark();
  }
}
