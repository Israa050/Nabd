import 'package:crypto_demo/features/coin_details/data/models/coin_detail_dto.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/coin_details.dart';

class CoinDetailsMapper {
  
  static CoinDetails fromModel(CoinDetailDto coin) {
    return CoinDetails(
      id: coin.id,
      symbol: coin.symbol,
      name: coin.name,
      description: coin.description,
      image: coin.image,
      rank: coin.rank,
      priceChange: coin.priceChange,
      marketCap: coin.marketCap,
      totalVolume: coin.totalVolume,
      availableSupply: coin.availableSupply,
      maxSupply: coin.maxSupply,
      currentPrice: coin.currentPrice,
      highestPrice: coin.highestPrice,
    );
  }
}
