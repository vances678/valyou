import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valyou/data/defaults.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    toggleableActiveColor: Defaults.colors.accent,
    scaffoldBackgroundColor: const Color(0xFF121220), // app background
    canvasColor: const Color(0xFF202030), // tab bar
    cardColor: const Color(0xFF202030), // card
    dividerColor: Defaults.colors.placeholder, // divider & dotted border
    dialogBackgroundColor: const Color(0xFF202030),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Defaults.colors.accent,
    ),
    iconTheme: IconThemeData(
      color: Defaults.colors.backgroundLight,
    ),
    appBarTheme: AppBarTheme(
      color: const Color(0xFF202030),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: Defaults.colors.backgroundLight,
      ),
      iconTheme: IconThemeData(
        color: Defaults.colors.backgroundLight,
      ),
    ),
  );
}
