import 'package:flutter/material.dart';
import '../constants/colors.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
    bodyMedium: TextStyle(
        height: 2, color: AppColors.blackIntermediate, fontSize: 15),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  useMaterial3: true,
);


ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
    ),
    bodyMedium: TextStyle(
        height: 2, color: AppColors.blackIntermediate, fontSize: 15),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  useMaterial3: true,
);