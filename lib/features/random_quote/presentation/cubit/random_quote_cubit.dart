import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean/core/error/failures.dart';
import 'package:quotes_clean/core/usecases/base_usecase.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';
import 'package:quotes_clean/features/random_quote/domain/usecases/get_random_quote.dart';

import '../../domain/entities/quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuoteUseCase usecase;

  RandomQuoteCubit({
    required this.usecase,
  }) : super(RandomQuoteInitial());

  //*metodi del cubit:
  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    //*chiamo il caso d'uso
    Either<Failure, Quote> response = await usecase(NoParams());
    //*guardo i casi:
    emit(response.fold(
      (failure) => RandomQuoteError(msg: _mapFailureToMsg(failure)),
      (quote) => RandomQuoteLoaded(quote: quote),
    ));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case ParsingFailure:
        return AppStrings.parsingFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.genericError;
    }
  }
}
