import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightprimary =Color(0xFFB7935F);
  static const Color white =Color(0xFFF8F8F8);
  static const Color black =Color(0xFF242424);
  static const Color darkprimary =Color(0xFF141A2E);
  static const Color gold =Color(0xFFFACC1D);


  static ThemeData lightTheme =ThemeData(
    primaryColor: lightprimary,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
       type: BottomNavigationBarType.fixed,
       backgroundColor: lightprimary,
       selectedItemColor: black,
       unselectedItemColor: white,
    ),
  );
  static ThemeData darkTheme =ThemeData(
    primaryColor: darkprimary,
  );


}