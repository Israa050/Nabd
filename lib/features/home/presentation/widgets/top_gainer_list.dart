import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/home/domain/entities/coin.dart';
import 'package:crypto_demo/features/home/presentation/widgets/coin_list_tile.dart';

class TopGainerList extends StatelessWidget {
  const TopGainerList({super.key,required this.topGainers});

  final List<Coin> topGainers;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: topGainers.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        final coin = topGainers[index];
        final CoinModel coinModel = CoinModel(
          name: coin.name, 
          symbol: coin.symbol, 
          price: coin.priceText,
           change: coin.change24hText, 
           isPositive: coin.isPositiveChange,
            iconPath: coin.imageUrl);
        return CoinListTile(coin: coinModel);
      },
    );
  }
}
