import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        )),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        headlineLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        )),
  );
}
