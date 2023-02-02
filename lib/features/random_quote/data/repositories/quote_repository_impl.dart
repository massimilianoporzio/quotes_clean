import 'package:quotes_clean/features/random_quote/domain/entities/quote.dart';
import 'package:quotes_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes_clean/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  @override
  Future<Either<Failure, Quote>> getRandomQuote() {
    // TODO: implement getRandomQuote
    throw UnimplementedError();
  }

  /*
  se connesso prendo i dati da remoteDS
  se no da local cache
  */
}
