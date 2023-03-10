import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/error/failures.dart';

import '../entities/quote.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
