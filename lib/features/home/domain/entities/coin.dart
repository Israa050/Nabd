
class Coin {
  final String id;
  final String symbol;
  final String name;
  final String imageUrl;
  final double priceUsd;
  final double priceChange24hPercent;

  const Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.imageUrl,
    required this.priceUsd,
    required this.priceChange24hPercent,
  });
}
