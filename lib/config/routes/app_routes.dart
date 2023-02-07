import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_clean/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_clean/features/random_quote/presentation/pages/quote_page.dart';
import 'package:quotes_clean/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:quotes_clean/features/splash/presentation/pages/splash_screen.dart';
import '../../core/utils/app_strings.dart';

import 'package:quotes_clean/injector_container.dart' as di;

class Routes {
  static const String initialRoute = '/';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => di.sl<RandomQuoteCubit>(), //chiedo al sl
            child: const SplashScreen(),
          );
        });
      case Routes.randomQuoteRoute:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => di.sl<RandomQuoteCubit>(), //chiedo al sl
            child: const QuotePage(),
          );
        });
      // case Routes.favouriteRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => const FavouriteQuotePage(),
      //   );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
