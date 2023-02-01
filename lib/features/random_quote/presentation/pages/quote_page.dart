import 'package:flutter/material.dart';
import 'package:quotes_clean/core/utils/assets_manager.dart';
import 'package:quotes_clean/core/utils/constants.dart';
import 'package:quotes_clean/core/utils/media_query_values.dart';
import 'package:quotes_clean/features/favourite_quote/presentation/cubit/favourite_quote_cubit.dart';
import 'package:quotes_clean/features/favourite_quote/presentation/pages/favourite_quote_page.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CIAO"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Constants.showErrorDialog(context: context, msg: "Error");
          },
          child: Image.asset(
            ImgAssets.quote,
            width: context.width,
          ),
        ),
      ),
    );
  }
}
