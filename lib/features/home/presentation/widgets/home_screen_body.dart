import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/networking/api_error_factory.dart';
import 'package:crypto_demo/core/networking/models/api_error_model.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/home/cubit/home_cubit.dart';
import 'package:crypto_demo/features/home/presentation/widgets/balance_card.dart';
import 'package:crypto_demo/features/home/presentation/widgets/market_overview_widget.dart';
import 'package:crypto_demo/features/home/presentation/widgets/top_gainer_widget.dart';
import 'package:crypto_demo/features/home/presentation/widgets/top_gainers_bloc_selector.dart';
import 'package:crypto_demo/features/home/presentation/widgets/trending_coins_widget.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadHome();
  }

  ApiErrorModel? _firstFailure(HomeState state) {
    if (state.marketStats.isFailure) {
      return state.marketStats.error;
    }
    if (state.topGainers.isFailure) {
      return state.topGainers.error;
    }
    if (state.trendingCoins.isFailure) {
      return state.trendingCoins.error;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.appColors.marketChangeTextColor,
      backgroundColor: context.appColors.surfaceContainer,
      onRefresh: () => context.read<HomeCubit>().loadHome(),
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) {
          return _firstFailure(previous) == null &&
              _firstFailure(current) != null;
        },
        listener: (context, state) {
          final error = _firstFailure(state) ?? ApiErrorFactory.defaultError;

          context.showApiErrorDialog(apiError: error);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 30, 15, 30),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: BalanceCard()),

              SliverToBoxAdapter(child: SizedBox(height: 14)),

              SliverToBoxAdapter(child: MarketOverviewWidget()),

              SliverToBoxAdapter(child: SizedBox(height: 19)),

              SliverToBoxAdapter(child: TrendingCoinsWidget()),

              SliverToBoxAdapter(child: SizedBox(height: 19)),

              SliverToBoxAdapter(child: TopGainersWidget()),

              TopGainersBlocSelector(),
            ],
          ),
        ),
      ),
    );
  }
}
