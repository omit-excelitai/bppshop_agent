
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utill/theme/dark_theme.dart';
import '../utill/theme/light_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  final _prefs = SharedPreferences.getInstance();

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData? get themeData => _themeData;

  Future<void> _loadTheme() async {
    final prefs = await _prefs;
    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    _themeData = isDarkTheme ? darkTheme : lightTheme;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await _prefs;
    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    await prefs.setBool('isDarkTheme', !isDarkTheme);
    _themeData = !isDarkTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}
