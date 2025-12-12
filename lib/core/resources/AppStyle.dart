import 'package:flutter/material.dart';

import 'ColorManager.dart';

class AppStyle {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: ColorManager.lightPrimaryColor,
    scaffoldBackgroundColor: ColorManager.lightSecondaryColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.lightSecondaryColor,
      foregroundColor: ColorManager.lightPrimaryColor,
      elevation: 0,
      centerTitle: true,
    ),

    iconTheme: const IconThemeData(
      color: ColorManager.lightPrimaryColor,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: ColorManager.lightPrimaryColor,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle( // تقدر تستخدمها لعناوين الأخبار
        color: ColorManager.lightPrimaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.lightPrimaryColor,
      ),
      bodySmall: TextStyle(
        color: ColorManager.greyColor,
      ),
    ),



    colorScheme: const ColorScheme.light(
      primary: ColorManager.lightPrimaryColor,
      surface: Colors.white,
      background: ColorManager.lightSecondaryColor,
      secondary: ColorManager.greyColor,
    ),

    dividerColor: ColorManager.greyColor,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: ColorManager.lightSecondaryColor,
    scaffoldBackgroundColor: ColorManager.lightPrimaryColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.lightPrimaryColor,
      foregroundColor: ColorManager.lightSecondaryColor,
      elevation: 0,
      centerTitle: true,
    ),

    iconTheme: const IconThemeData(
      color: ColorManager.lightSecondaryColor,
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: ColorManager.lightSecondaryColor,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: ColorManager.lightSecondaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        color: ColorManager.lightSecondaryColor,
      ),
      bodySmall: TextStyle(
        color: ColorManager.greyColor,
      ),
    ),


    colorScheme: const ColorScheme.dark(
      primary: ColorManager.lightSecondaryColor,
      surface: Color(0xff1F1F1F),
      background: ColorManager.lightPrimaryColor,
      secondary: ColorManager.greyColor,
    ),

    dividerColor: ColorManager.greyColor,
  );
}
