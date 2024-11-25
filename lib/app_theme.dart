import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightprimary =Color(0xFFB7935F);
  static const Color white =Color(0xFFF8F8F8);
  static const Color black =Color(0xFF242424);
  static const Color darkprimary =Color(0xFF141A2E);
  static const Color gold =Color(0xFFFACC1D);


  static ThemeData lightTheme =ThemeData(
    primaryColor:lightprimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color:white,
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
        color: black,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      )
    )
  );



  static ThemeData darkTheme =ThemeData(
     primaryColor: darkprimary,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       type: BottomNavigationBarType.fixed,
       backgroundColor: darkprimary,
       selectedItemColor: gold,
       unselectedItemColor: white,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: gold,
      )
    )
  );


}