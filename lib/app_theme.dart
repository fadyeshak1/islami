import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightprimary =Color(0xFFB7935F);
  static const Color white =Color(0xFFF8F8F8);
  static const Color black =Color(0xFF242424);
  static const Color darkprimary =Color(0xFF141A2E);
  static const Color gold =Color(0xFFFACC1D);


  static ThemeData lightTheme =ThemeData(
    primaryColor: lightprimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       type: BottomNavigationBarType.fixed,
       backgroundColor: lightprimary,
       selectedItemColor: black,
       unselectedItemColor: white,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      )
    )
  );
  static ThemeData darkTheme =ThemeData(
    primaryColor: darkprimary,
  );


}