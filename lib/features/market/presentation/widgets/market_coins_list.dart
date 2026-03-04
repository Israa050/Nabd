import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/core/widgets/custom_loading_indicator.dart';
import 'package:crypto_demo/features/market/domain/entities/market_coin.dart';
import 'package:crypto_demo/features/market/presentation/widgets/market_coin_list_tile.dart';

class MarketCoinsList extends StatelessWidget {
  final List<MarketCoin> coins;
  final bool isLoadingMore;
  final bool hasMore;
  final VoidCallback? onLoadMore;

  const MarketCoinsList({
    super.key,
    required this.coins,
    required this.isLoadingMore,
    required this.hasMore,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    // Should we show an extra item for pagination loader
    final showLoader = hasMore && onLoadMore != null;

    final totalItemCount = coins.length + (showLoader ? 1 : 0);

    return SliverList.separated(
      itemCount: totalItemCount,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        // 🔹 Pagination loader at the end
        if (showLoader && index == coins.length) {
          // Trigger loadMore when the loader widget appears
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (onLoadMore != null) onLoadMore!();
          });

          return LoadingMoreIndicator();
        }

        // Normal coin item
        final currentCoin = coins[index];
        final coin = MarketCoinUI(
          id: currentCoin.id,
          name: currentCoin.name,
          price: currentCoin.price.usd,
          change: currentCoin.marketCapChange24hPercent.percent,
          isPositive: currentCoin.marketCapChange24hPercent > 0,
          imagePath: currentCoin.image,
          rank: currentCoin.rank.toString(),
        );

        return MarketCoinListTile(coin: coin);
      },
    );
  }
}