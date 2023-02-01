import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/app_colors.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            "'Measuring programming progress by lines of code is like measuring aircraft building progress by weight '",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Bill Gates',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
