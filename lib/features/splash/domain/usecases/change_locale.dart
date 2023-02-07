import 'package:quotes_clean/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes_clean/core/usecases/base_usecase.dart';
import 'package:quotes_clean/features/splash/domain/repositories/lang_repository.dart';

class ChangeLocaleUseCase implements BaseUseCase<bool, String> {
  final LangRepository langRepository;

  ChangeLocaleUseCase({required this.langRepository});
  @override
  Future<Either<Failure, bool>> call(String langCode) async {
    return await langRepository.changeLang(langCode: langCode);
  }
}
