import 'package:quotes_clean/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteLocalDS {
  Future<QuoteModel> getLastRandomQuote(); //*fa da cache
  Future<void> cacheQuote(QuoteModel quoteModel); //* mette in cache
}
