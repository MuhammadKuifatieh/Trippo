import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'SFPRODISPLAY',   
      primaryColor: const Color(0xff32B768),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(0xff32B768, {
        50: Color(0xff32B768),
        100: Color(0xff32B768),
        200: Color(0xff32B768),
        300: Color(0xff32B768),
        400: Color(0xff32B768),
        500: Color(0xff32B768),
        600: Color(0xff32B768),
        700: Color(0xff32B768),
        800: Color(0xff32B768),
        900: Color(0xff32B768),
      })).copyWith(
        secondary: const Color(0xff333333),
        error: const Color(0xffFF97A7),
        
      ),
      errorColor: const Color(0xffFF97A7),
      scaffoldBackgroundColor: Colors.white,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff32B768),
      ),
    );
  }
}
