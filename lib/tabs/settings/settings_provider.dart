import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode  = ThemeMode.light ;
  String languageCode = 'en';

  // bool get isDark =>themeMode == ThemeMode.dark ;

  String get backgroundImageName => 
  themeMode== ThemeMode.light ? 'default_bg' : 'dark_bg';

  void changeTheme(ThemeMode SelectedTheme){
    themeMode = SelectedTheme ;
    notifyListeners();
  }

  void changeLanguage(String SelectedLanguage){
    languageCode = SelectedLanguage ;
    notifyListeners();
  }
}