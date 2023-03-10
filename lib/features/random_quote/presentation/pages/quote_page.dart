import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes_clean/config/locale/app_localizations.dart';
import 'package:quotes_clean/core/utils/app_colors.dart';
import 'package:quotes_clean/core/utils/app_strings.dart';
import 'package:quotes_clean/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes_clean/features/random_quote/presentation/widgets/quote_card.dart';

import 'package:quotes_clean/core/widgets/error_widget.dart' as error_widget;
import 'package:quotes_clean/features/splash/presentation/cubit/locale_cubit.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  _getRandomQuote() {
    BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.black.withOpacity(0.4),
      ),
      leading: IconButton(
        onPressed: () {
          if (AppLocalizations.of(context)!.isEnLocale) {
            BlocProvider.of<LocaleCubit>(context).toItalian();
          } else {
            BlocProvider.of<LocaleCubit>(context).toEnglish();
          }
        },
        icon: const Icon(
          Icons.translate_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(AppLocalizations.of(context)!.translate('app_name')!),
    );

    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: appBar,
        body: _buildBodyContent(),
      ),
    );
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        // state = const RandomQuoteError(msg: "ahahah");
        if (state is RandomQuoteIsLoading) {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primary,
            ),
          );
        } else if (state is RandomQuoteError) {
          return error_widget.ErrorWidget(
            onPress: () => _getRandomQuote(),
          );
        } else if (state is RandomQuoteLoaded) {
          return Column(
            children: [
              QuoteCard(
                quote: state.quote,
              ),
              InkWell(
                onTap: () {
                  _getRandomQuote();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.refresh,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        } else {
          //*tutti gli altri stati:
          return Center(
            child: SpinKitChasingDots(
              color: AppColors.primary,
            ),
          );
        }
      },
    );
  }
}
