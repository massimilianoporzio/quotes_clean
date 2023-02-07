import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_clean/core/api/endpoints.dart';
import 'package:quotes_clean/core/error/exceptions.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';

import 'package:quotes_clean/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDS {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDSImpl implements RandomQuoteRemoteDS {
  http.Client client;
  RandomQuoteRemoteDSImpl({
    required this.client,
  });

  @override
  Future<QuoteModel> getRandomQuote() async {
    final randomQuoteUrl = Uri.parse(EndPoints.randomQuote);
    final response = await client.get(randomQuoteUrl, headers: {
      'Content-Type': AppStrings.contentType,
    });

    if (response.statusCode == 200) {
      try {
        return QuoteModel.fromJson(json.decode(response.body));
      } on Exception {
        throw ParsingException();
      }
    } else {
      throw ServerException();
    }
  }
}
