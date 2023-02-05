import 'dart:convert';

import 'package:quotes_clean/core/error/exceptions.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';
import 'package:quotes_clean/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDS {
  Future<QuoteModel> getLastRandomQuote(); //*fa da cache
  Future<void> cacheQuote(QuoteModel quoteModel); //* mette in cache
}

class RandomQuoteLocalDSImpl implements RandomQuoteLocalDS {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDSImpl({required this.sharedPreferences});

  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    try {
      return sharedPreferences.setString(
        AppStrings.cachedRandomQuote,
        json.encode(quoteModel), //*chiama toJson di QuoteModel
      );
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<QuoteModel> getLastRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString == null) {
      throw CacheException();
    } else {
      final cachedRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedRandomQuote;
    }
  }
}
