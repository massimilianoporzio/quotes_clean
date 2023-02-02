import 'package:quotes_clean/core/error/exceptions.dart';
import 'package:quotes_clean/core/network/network_info.dart';
import 'package:quotes_clean/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes_clean/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes_clean/features/random_quote/domain/entities/quote.dart';
import 'package:quotes_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes_clean/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDS localDataSource;
  final RandomQuoteRemoteDS remoteDataSource;

  QuoteRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    try {
      if (await networkInfo.isConnected) {
        final remoteRandomQuote = await remoteDataSource.getRandomQuote();
        return Right(remoteRandomQuote);
      } else {
        final cachedQuote = await localDataSource.getLastRandomQuote();
        return Right(cachedQuote);
      }
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    } on Exception {
      return Left(GenericFailure());
    }
  }

  /*
  se connesso prendo i dati da remoteDS
  se no da local cache
  */
}
