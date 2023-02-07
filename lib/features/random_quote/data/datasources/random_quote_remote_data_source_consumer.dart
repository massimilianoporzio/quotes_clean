import 'dart:convert';

import 'package:quotes_clean/core/api/endpoints.dart';
import 'package:quotes_clean/features/random_quote/data/models/quote_model.dart';

import '../../../../core/api/api_consumer.dart';
import 'random_quote_remote_data_source.dart';

class RandomQuoteRemoteDSImplConsumer implements RandomQuoteRemoteDS {
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDSImplConsumer({
    required this.apiConsumer,
  });

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(EndPoints.randomQuote);
    return QuoteModel.fromJson((response));
  }
}
