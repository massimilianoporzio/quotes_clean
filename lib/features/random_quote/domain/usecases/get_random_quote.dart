import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_clean/core/error/failures.dart';
import 'package:quotes_clean/core/usecases/base_usecase.dart';

import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuoteUseCase implements BaseUseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuoteUseCase({required this.quoteRepository});

  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    return quoteRepository.getRandomQuote();
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
