import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const themeStatus = "THEME_STATUS";
  bool _isDarkTheme;

  ThemeProvider({required bool initialTheme}) : _isDarkTheme = initialTheme;

  bool get getIsDarkTheme => _isDarkTheme;

  Future<void> setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
    _isDarkTheme = value;
    notifyListeners();
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool(themeStatus) ?? false;
    notifyListeners();
    return _isDarkTheme;
  }
}
