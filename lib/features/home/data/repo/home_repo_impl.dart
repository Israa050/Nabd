
import 'package:crypto_demo/core/networking/api_error_handler.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/networking/api_service.dart';
import 'package:crypto_demo/features/home/data/models/coin_model_dto.dart';
import 'package:crypto_demo/features/home/data/models/global_market_stats_dto.dart';
import 'package:crypto_demo/features/home/data/models/trending_coin_dto.dart';
import 'package:crypto_demo/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<ApiResult<List<TrendingCoinDto>>> getTrendingCoins() async {
    try {
      final response = await apiService.getTrending();
      return ApiResult.success(response.coins);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<MarketGlobalDto>> getMarketStatistics() async{
    try {
      final response = await apiService.getMarketStatistics();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<List<CoinModel>>> getTopGainers()async {
    try {
    final response = await apiService.getTopGainers();
    return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }
}