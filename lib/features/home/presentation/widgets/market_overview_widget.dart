import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/home/cubit/home_cubit.dart';
import 'package:crypto_demo/features/home/domain/entities/market_overview.dart';
import 'package:crypto_demo/features/home/presentation/widgets/market_stat_row_shimmer.dart';
import 'package:crypto_demo/features/home/presentation/widgets/market_state_row.dart';

class MarketOverviewWidget extends StatelessWidget {
  const MarketOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.marketOverview,
          style: context.typography.displayTitle.copyWith(
            letterSpacing: 0.5,
            height: 1.12,
            color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
          ),
        ),
        const SizedBox(height: 10),

        BlocSelector<HomeCubit, HomeState, AsyncState<MarketOverview>>(
          selector: (state) => state.marketStats,
          builder: (context, marketState) {
            return marketState.when(
              loading: () => MarketStateRowShimmer(),
              success: (data) => MarketStateRow(marketOverview: data),
              failure: (error) => SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
