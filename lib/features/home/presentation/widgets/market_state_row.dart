

import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/core/widgets/market_state_grid.dart';
import 'package:crypto_demo/features/home/domain/entities/market_overview.dart';
import 'package:crypto_demo/features/home/presentation/widgets/market_stat_card.dart';

class MarketStateRow extends StatelessWidget {
 final MarketOverview marketOverview;
  const MarketStateRow({super.key, required this.marketOverview});

  @override
  Widget build(BuildContext context) {
    return MarketStateGrid(
      cardBuilder: (position) {
        switch (position) {
          case MarketStatPosition.marketCap:
            return MarketStatCard(
              data: MarketStat(
                title: AppConstants.marketCap,
                value: marketOverview.marketCapText,
                change:  marketOverview.marketChange,
                iconPath: 'assets/svgs/arrow.svg',
              ),
            );

          case MarketStatPosition.volume:
            return MarketStatCard(
              data: MarketStat(
                title: AppConstants.twentyFourVolume,
                value: marketOverview.volume24hText,
                change: marketOverview.marketChange,
                iconPath: 'assets/svgs/arrow.svg',
              ),
            );

          case MarketStatPosition.btcDominance:
            return  MarketStatCard(
              data: MarketStat(
                title: AppConstants.btcDominance,
                value: marketOverview.btcDominanceText,
                showChange: false,
              ),
            );

          case MarketStatPosition.activeCoins:
            return  MarketStatCard(
              data: MarketStat(
                title: AppConstants.activeCoins,
                value: marketOverview.activeCoins.toString(),
                showChange: false,
              ),
            );
        }
      },
    );
  }
}