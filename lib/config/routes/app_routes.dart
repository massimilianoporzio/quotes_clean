import 'package:flutter/material.dart';
import 'package:quotes_clean/features/favourite_quote/presentation/pages/favourite_quote_page.dart';
import 'package:quotes_clean/features/random_quote/presentation/pages/quote_page.dart';

import '../../core/utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favouriteRoute = '/favouriteQuote';
  static const String randomQuoteRoute = '/randomQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const QuotePage();
        });
      case Routes.favouriteRoute:
        return MaterialPageRoute(
          builder: (context) => const FavouriteQuotePage(),
        );

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
