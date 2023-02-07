import 'package:flutter/material.dart';
import 'package:quotes_clean/config/locale/app_localizations_setup.dart';
import 'package:quotes_clean/config/routes/app_routes.dart';
import 'package:quotes_clean/config/themes/app_theme.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_clean/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:quotes_clean/injector_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LocaleCubit>()
            ..getSavedLang(), //*serve a caricare dalla sharedPrefs l'ultimo lang
        )
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) {
          return previous !=
              current; //*rebuild SOLO se il nuovo locale è diverso dal vecchio
        },
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
