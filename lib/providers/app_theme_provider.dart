import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode _appTheme = ThemeMode.light;

  ThemeMode get appTheme => _appTheme;

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (newTheme == _appTheme) return;

    _appTheme = newTheme;
    notifyListeners();

    // Save to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newTheme == ThemeMode.dark);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _appTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }


bool isDarkMode(){
    return appTheme ==ThemeMode.dark;
  }
}