import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valyou/data/defaults.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    brightness: Brightness.light,
    toggleableActiveColor: Defaults.colors.accentDark,
    scaffoldBackgroundColor: Defaults.colors.background, // app background
    canvasColor: Defaults.colors.backgroundLight, // tab bar
    cardColor: Defaults.colors.backgroundLight, // card
    dividerColor: Defaults.colors.placeholder, // divider & dotted border
    dialogBackgroundColor: Defaults.colors.backgroundLight,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => Defaults.colors.detail.withAlpha(20),
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => Defaults.colors.detail,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Defaults.colors.accentDark,
    ),
    iconTheme: IconThemeData(
      color: Defaults.colors.detailDark,
    ),
    appBarTheme: AppBarTheme(
      color: Defaults.colors.backgroundLight,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: Defaults.colors.text,
      ),
      iconTheme: IconThemeData(
        color: Defaults.colors.detail,
      ),
    ),
  );
}
