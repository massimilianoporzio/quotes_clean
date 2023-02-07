import 'package:quotes_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/usecases/base_usecase.dart';
import 'package:quotes_clean/features/splash/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase implements BaseUseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});
  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await langRepository.getSavedLang();
  }
}
