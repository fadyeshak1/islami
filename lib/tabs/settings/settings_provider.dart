import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _languageCode = 'en';

  SettingsProvider() {
    _loadSettings(); 
  }

  ThemeMode get themeMode => _themeMode;
  String get languageCode => _languageCode;

  String get backgroundImageName =>
      _themeMode == ThemeMode.light ? 'default_bg' : 'dark_bg';

      
  String get sebhaImage=>
      _themeMode == ThemeMode.light ? 'body_sebha_logo' : 'body_sebha_dark';

      String get headImage =>
      _themeMode == ThemeMode.light ? 'head_sebha_logo' : 'head_sebha_dark';

  void changeTheme(ThemeMode selectedTheme) async {
    _themeMode = selectedTheme;
    notifyListeners();
    await _saveThemeToPreferences(selectedTheme);
  }


  void changeLanguage(String selectedLanguage) async {
    _languageCode = selectedLanguage;
    notifyListeners();
    await _saveLanguageToPreferences(selectedLanguage);
  }

  Future<void> _loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? theme = prefs.getString('themeMode');
    if (theme != null) {
      _themeMode = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }

    _languageCode = prefs.getString('languageCode') ?? 'en';

    notifyListeners(); 
  }

  Future<void> _saveThemeToPreferences(ThemeMode themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', themeMode == ThemeMode.dark ? 'dark' : 'light');
  }

  Future<void> _saveLanguageToPreferences(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }
}
