

class CoinDetailDto {
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

  CoinDetailDto({
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


  
  factory CoinDetailDto.fromJson(Map<String, dynamic> json) {
  final marketData = json['market_data'] as Map<String, dynamic>? ?? {};

  num _num(dynamic v) => (v as num?) ?? 0;

  return CoinDetailDto(
    id: json['id'] ?? '',
    symbol: json['symbol'] ?? '',
    name: json['name'] ?? '',
    description: json['description']?['en'] ?? '',
    image: json['image']?['large'] ?? '',

    rank: _num(json['market_cap_rank']),
    currentPrice: _num(marketData['current_price']?['usd']),
    highestPrice: _num(marketData['ath']?['usd']),
    marketCap: _num(marketData['market_cap']?['usd']),
    totalVolume: _num(marketData['total_volume']?['usd']),
    availableSupply: _num(marketData['circulating_supply']),
    maxSupply: _num(marketData['max_supply']),
    priceChange: _num(marketData['price_change_percentage_24h']),
  );
}

}
