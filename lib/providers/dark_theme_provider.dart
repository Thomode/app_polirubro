import 'package:app_polirubro/preferences/dark_theme_preference.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  final DarkThemePreference _darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    _darkThemePreference.setDarkTheme(_darkTheme);
    notifyListeners();
  }

  Future<void> init () async {
    _darkTheme = await _darkThemePreference.getTheme();
    notifyListeners();
  }
}