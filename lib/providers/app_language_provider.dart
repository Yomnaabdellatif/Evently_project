import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String savedAppLanguage = "en";

  String get appLanguage => savedAppLanguage;

  Future<void> changeLanguage(String newLanguage) async {
    if (newLanguage == savedAppLanguage) return;

    savedAppLanguage = newLanguage;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', newLanguage);
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    savedAppLanguage = prefs.getString('appLanguage') ?? "en";
    notifyListeners();
  }
}
