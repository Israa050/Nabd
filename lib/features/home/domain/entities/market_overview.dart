
class MarketOverview {
  final double marketCapUsd;
  final double volume24hUsd;
  final double marketCapChange24hPercent;
  final double btcDominancePercent;
  final int activeCoins;

  const MarketOverview({
    required this.marketCapUsd,
    required this.volume24hUsd,
    required this.marketCapChange24hPercent,
    required this.btcDominancePercent,
    required this.activeCoins,
  });
}