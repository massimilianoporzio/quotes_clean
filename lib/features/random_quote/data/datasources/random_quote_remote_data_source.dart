import 'package:quotes_clean/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDS {
  Future<QuoteModel> getRandomQuote();
}
