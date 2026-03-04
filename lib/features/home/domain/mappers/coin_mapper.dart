
import 'package:crypto_demo/features/home/data/models/coin_model_dto.dart';
import 'package:crypto_demo/features/home/domain/entities/coin.dart';


class CoinMapper {
  static Coin fromModel(CoinModel model) {
    return Coin(
      id: model.id,
      symbol: model.symbol.toUpperCase(),
      name: model.name,
      imageUrl: model.image,
      priceUsd: (model.currentPrice ?? 0).toDouble(),
      priceChange24hPercent:
          (model.priceChangePercentage ?? 0).toDouble(),
    );
  }
}