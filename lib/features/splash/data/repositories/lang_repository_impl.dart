import 'package:quotes_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes_clean/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes_clean/features/splash/domain/repositories/lang_repository.dart';

import '../../../../core/error/exceptions.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDS localDS;

  LangRepositoryImpl({required this.localDS});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged = await localDS.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await localDS.getSavedLang();
      return Right(langCode);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
