import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white);
}
