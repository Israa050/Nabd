

class MarketCoin {
  final String id;
  final String name;
  final String image;
  final num price;
  final num rank;
  final num marketCapChange24hPercent;

  MarketCoin({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rank,
    required this.marketCapChange24hPercent,
  });
}
