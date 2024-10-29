import 'package:flutter/material.dart';
import 'package:minimal_addiciton_beater/theme/dark_mode.dart';
import 'package:minimal_addiciton_beater/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  bool isHidingAddiction = true;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData = isDarkMode ? lightMode : darkMode;
    notifyListeners();
  }

  void toggleHideAddiction() {
    isHidingAddiction = !isHidingAddiction;
    notifyListeners();
  }
}
