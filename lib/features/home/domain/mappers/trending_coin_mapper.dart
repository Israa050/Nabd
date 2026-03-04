
import 'package:crypto_demo/features/home/data/models/trending_coin_dto.dart';
import 'package:crypto_demo/features/home/domain/entities/trending_coin.dart';

class TrendingCoinMapper {
  static TrendingCoin fromDto(TrendingCoinDto dto) {
    return TrendingCoin(
      id: dto.id,
      name: dto.name,
      symbol: dto.symbol,
      imageUrl: dto.imageUrl,
      priceUsd: dto.priceUsd,
      changePercent24h: dto.changePercent24h,
    );
  }
}