import 'package:flutter/material.dart';
import 'package:quotes_clean/features/random_quote/presentation/pages/quote_page.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuotePage(),
    );
  }
}
