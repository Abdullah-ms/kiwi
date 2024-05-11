import 'package:flutter/material.dart';
import '../constants/colors.dart';

ThemeData themeEnglish = ThemeData(
  // fontFamily: "PlayfairDisplay",
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.primaryColor),
    backgroundColor: Colors.grey[50],
    titleTextStyle:TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 25),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: AppColors.primaryColor) ,
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