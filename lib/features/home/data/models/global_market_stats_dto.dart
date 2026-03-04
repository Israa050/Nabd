
class MarketGlobalDto {
  final double marketCapUsd;
  final double volume24hUsd;
  final double marketCapChange24hPercent;
  final double btcDominancePercent;
  final int activeCoins;
  MarketGlobalDto({
    required this.marketCapUsd,
    required this.volume24hUsd,
    required this.marketCapChange24hPercent,
    required this.btcDominancePercent,
    required this.activeCoins,
  });
  factory MarketGlobalDto.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return MarketGlobalDto(
      marketCapUsd: (data['total_market_cap']['usd'] as num).toDouble(),
      volume24hUsd: (data['total_volume']['usd'] as num).toDouble(),
      marketCapChange24hPercent:
          (data['market_cap_change_percentage_24h_usd'] as num).toDouble(),
      btcDominancePercent: (data['market_cap_percentage']['btc'] as num)
          .toDouble(),
      activeCoins: data['active_cryptocurrencies'] as int,
    );
  }
}