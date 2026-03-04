
class TrendingCoinDto {
  final String id;
  final String name;
  final String symbol;
  final double priceUsd;
  final double changePercent24h;
  final String imageUrl;

  TrendingCoinDto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.priceUsd,
    required this.changePercent24h,
    required this.imageUrl,
  });

  factory TrendingCoinDto.fromJson(Map<String, dynamic> json) {
    final item = json['item'] as Map<String, dynamic>;
    final data = item['data'] as Map<String, dynamic>;

    return TrendingCoinDto(
      id: item['id'] as String,
      name: item['name'] as String,
      symbol: item['symbol'] as String,
      imageUrl: item['thumb'] as String,
      priceUsd: (data['price'] as num).toDouble(),
      changePercent24h:
          (data['price_change_percentage_24h']['usd'] as num)
              .toDouble(),
    );
  }
}