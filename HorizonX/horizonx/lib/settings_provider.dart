import 'package:flutter/material.dart';
import 'package:horizonx/app_theme.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Color get themeColor => themeMode == ThemeMode.light
      ? AppTheme.backgroundLightMode
      : AppTheme.backgroundDarkMode;
  // Color get textThemeColor =>
  //     themeMode == ThemeMode.light ? AppTheme.black : AppTheme.white;
  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }
}
