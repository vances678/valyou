import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  bool darkModeEnabled = true;

  ThemeMode currentTheme() {
    return darkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    darkModeEnabled = !darkModeEnabled;
    notifyListeners();
  }
}
