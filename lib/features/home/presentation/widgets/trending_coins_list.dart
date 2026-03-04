import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/home/domain/entities/trending_coin.dart';
import 'package:crypto_demo/features/home/presentation/widgets/crypto_overview_card.dart';

class TrendingCoinsList extends StatelessWidget {
  const TrendingCoinsList({super.key, required this.trendingCoins});

  final List<TrendingCoin> trendingCoins;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trendingCoins.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final coin = trendingCoins[index];
        final trendingCoin = CryptoOverviewModel(
          name: coin.name,
          symbol: coin.symbol,
          price: coin.priceText,
          changePercent: coin.change24hText,
          iconPath: coin.imageUrl,
          isPositive: coin.isPositiveChange,
        );
        return CryptoOverviewCard(data: trendingCoin);
      },
    );
  }
}
