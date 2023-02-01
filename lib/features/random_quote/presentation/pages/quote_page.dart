import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_clean/core/utils/app_colors.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';
import 'package:quotes_clean/features/random_quote/presentation/widgets/quote_card.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.black.withOpacity(0.4),
      ),
      title: const Text(AppStrings.appName),
    );

    return Scaffold(
      appBar: appBar,
      body: _buildBodyContent(),
    );
  }
}

Widget _buildBodyContent() {
  return Column(
    children: [
      QuoteCard(),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child: const Icon(
          Icons.refresh,
          size: 28,
          color: Colors.white,
        ),
      ),
    ],
  );
}
