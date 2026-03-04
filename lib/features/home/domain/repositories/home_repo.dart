


import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/home/data/models/coin_model_dto.dart';
import 'package:crypto_demo/features/home/data/models/global_market_stats_dto.dart';
import 'package:crypto_demo/features/home/data/models/trending_coin_dto.dart';

abstract class HomeRepo {
  
  Future<ApiResult<List<TrendingCoinDto>>> getTrendingCoins();
  Future<ApiResult<List<CoinModel>>> getTopGainers();
  Future<ApiResult<MarketGlobalDto>> getMarketStatistics();
}