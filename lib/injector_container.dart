import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes_clean/core/api/app_interceptor.dart';
import 'package:quotes_clean/core/network/network_info.dart';
import 'package:quotes_clean/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quotes_clean/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quotes_clean/features/random_quote/data/datasources/random_quote_remote_data_source_consumer.dart';
import 'package:quotes_clean/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quotes_clean/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes_clean/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes_clean/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_clean/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:quotes_clean/features/splash/data/repositories/lang_repository_impl.dart';
import 'package:quotes_clean/features/splash/domain/repositories/lang_repository.dart';
import 'package:quotes_clean/features/splash/domain/usecases/change_locale.dart';
import 'package:quotes_clean/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:quotes_clean/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/api_consumer.dart';
import 'core/api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!Features
  //*blocs come factory!!!Ogni screen istanzia il suo
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(usecase: sl())); //*chiedo al sl il caso d'uso

  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  //*usecases
  sl.registerLazySingleton<GetRandomQuoteUseCase>(
      () => GetRandomQuoteUseCase(quoteRepository: sl()));
  sl.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(langRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));

  //*repos
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(localDS: sl()));

  //*datasources
  sl.registerLazySingleton<RandomQuoteLocalDS>(
      () => RandomQuoteLocalDSImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<RandomQuoteRemoteDS>(
      () => RandomQuoteRemoteDSImplConsumer(apiConsumer: sl()));

  sl.registerLazySingleton<LangLocalDS>(
      () => LangLocalDSImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  //! External
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefs);
  sl.registerLazySingleton(() => AppInterceptor());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      error: true)); //*cosa loggo
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
