import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';
import 'package:quotes_clean/features/splash/domain/usecases/change_locale.dart';
import 'package:quotes_clean/features/splash/domain/usecases/get_saved_lang.dart';

import '../../../../core/usecases/base_usecase.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLocaleUseCase changeLangUseCase;

  //*équando creo un cubit LocaleCubit inizio con english
  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(
          const ChangeLocaleState(
            Locale(AppStrings.englishCode),
          ),
        );

  String currentLangCode = AppStrings.englishCode;
  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (langCode) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure),
        (isChanged) {
      currentLangCode = isChanged ? langCode : AppStrings.englishCode;
      emit(ChangeLocaleState(Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toItalian() => _changeLang(AppStrings.italianCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
