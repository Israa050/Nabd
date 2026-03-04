

class TrendingCoin {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double changePercent24h;
  final String imageUrl;

  const TrendingCoin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.changePercent24h,
    required this.imageUrl,
  });
}