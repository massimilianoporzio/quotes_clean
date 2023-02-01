import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';

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
  return Column();
}
