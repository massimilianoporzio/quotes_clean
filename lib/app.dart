import 'package:flutter/material.dart';
import 'package:quotes_clean/config/routes/app_routes.dart';
import 'package:quotes_clean/config/themes/app_theme.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
