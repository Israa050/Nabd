
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/market/data/models/market_coin_dto.dart';
import 'package:crypto_demo/features/market/data/models/search_response_dto.dart';

abstract class MarketCoinRepo {

  Future<ApiResult<List<MarketCoinDto>>> getMarketCoins(
   {int page = 1}
  );

  Future<ApiResult<SearchResponseDto>> searchCoinByKeyword(String keyword);
}