import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryGoldColor = Color(0XFFFFA841);
  static const Color primaryBlueColor = Color(0XFF005A9E);
  static const Color backgroundLightMode = Color(0XFFEFF8FF);
  static const Color backgroundDarkMode = Color(0XFF1D1D1D);
  static const Color textFieldBackgroundColor = Color(0xFF303030);
  static const Color onBoardingIconsAndHintColor = Color(0xFF979797);
  static const Color profileTextColor = Color(0XFF6397BE);
  static const Color profileFilledTextField = Color(0XFFC5D3DD);

  static ThemeData lightTheme = ThemeData(
    primaryColor: backgroundLightMode,
    // appBarTheme: const AppBarTheme(
    //     color: primaryBlueColor,
    //     titleTextStyle: TextStyle(
    //         color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
    scaffoldBackgroundColor: backgroundLightMode,
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: Colors.white,

    // textTheme: const TextTheme(
    //     bodyLarge: TextStyle(
    //         fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black))
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: backgroundDarkMode,
  );
}
