class CoinDetails {
  final String id;
  final String symbol;
  final String name;
  final String description;
  final String image;
  final num rank;
  final num priceChange;
  final num marketCap;
  final num totalVolume;
  final num availableSupply;
  final num maxSupply;
  final num currentPrice;
  final num highestPrice;

  CoinDetails({
    required this.id,
    required this.symbol,
    required this.name,
    required this.description,
    required this.image,
    required this.rank,
    required this.priceChange,
    required this.marketCap,
    required this.totalVolume,
    required this.availableSupply,
    required this.maxSupply,
    required this.currentPrice,
    required this.highestPrice,
  });
}
