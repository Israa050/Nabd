
import 'package:crypto_demo/features/market/data/models/searched_coin_dto.dart';
import 'package:crypto_demo/features/market/domain/entities/market_coin.dart';

class SearchedCoinMapper {
  static MarketCoin fromModel(SearchedCoinDto coin) {
    return MarketCoin(
      id: coin.id,
      name: coin.name,
      image: coin.large,
      price:  0,
      rank:  coin.rank,
      marketCapChange24hPercent: 0,
    );
  }
}