import 'package:flutter/material.dart';

class FavouriteQuotePage extends StatefulWidget {
  const FavouriteQuotePage({super.key});

  @override
  State<FavouriteQuotePage> createState() => _FavouriteQuotePageState();
}

class _FavouriteQuotePageState extends State<FavouriteQuotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Favourite Quote",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
