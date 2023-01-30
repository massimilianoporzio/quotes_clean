import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/app_colors.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';
import 'package:quotes_clean/features/random_quote/presentation/pages/quote_page.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
      ),
      home: const QuotePage(),
    );
  }
}
