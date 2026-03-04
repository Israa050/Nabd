import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/home/cubit/home_cubit.dart';
import 'package:crypto_demo/features/home/domain/entities/trending_coin.dart';
import 'package:crypto_demo/features/home/presentation/widgets/crypto_overview_shimmer_list.dart';
import 'package:crypto_demo/features/home/presentation/widgets/trending_coins_list.dart';

class TrendingCoinsWidget extends StatelessWidget {
  const TrendingCoinsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppConstants.trendingNow,
              style: context.typography.displayTitle.copyWith(
                letterSpacing: 0.5,
                height: 1.12,
                color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
              ),
            ),

            TextButton(
              onPressed: () {
                //TO-DO
              },
              child: Text(
                AppConstants.viewAll,
                style: context.typography.bodySmall.copyWith(
                  color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),

        SizedBox(height: 15),

        BlocSelector<HomeCubit, HomeState, AsyncState<List<TrendingCoin>>>(
          selector: (state) => state.trendingCoins,
          builder: (context, trendingCoinsList) {
            return trendingCoinsList.when(
              loading: () =>
                  SizedBox(height: 132, child: CryptoOverviewShimmerList()),
              success: (data) => SizedBox(
                height: 132,
                child: TrendingCoinsList(trendingCoins: data),
              ),
              failure: (error) => SizedBox.shrink(),
            );
          },
        ),
      ],
    );
  }
}
