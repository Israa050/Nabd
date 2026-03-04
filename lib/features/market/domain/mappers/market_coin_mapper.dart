import 'package:crypto_demo/features/market/data/models/market_coin_dto.dart';
import 'package:crypto_demo/features/market/domain/entities/market_coin.dart';

class MarketCoinMapper {
  static MarketCoin fromModel(MarketCoinDto coin) {
    return MarketCoin(
      id: coin.id,
      name: coin.name,
      image: coin.image,
      price: coin.currentPrice?? 0,
      rank: coin.marketCapRank?? 0,
      marketCapChange24hPercent: coin.marketCapChange24hPercent?? 0,
    );
  }
}
