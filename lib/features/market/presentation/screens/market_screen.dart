import 'package:crypto_demo/core/di/dependency_injection.dart';
import 'package:crypto_demo/features/market/cubit/market_coin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/widgets/app_bar_title_widget.dart';
import 'package:crypto_demo/features/market/presentation/widgets/market_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MarketCoinCubit>(),
      child: Scaffold(
        appBar: AppBarTitleWidget(title: AppConstants.cryptoMarket),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Color(0xffF5F8FE),
        body: MarketScreenBody(),
        //bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
