
import 'package:crypto_demo/core/networking/api_error_handler.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/networking/api_service.dart';
import 'package:crypto_demo/features/market/data/models/market_coin_dto.dart';
import 'package:crypto_demo/features/market/data/models/search_response_dto.dart';
import 'package:crypto_demo/features/market/domain/repositories/market_coin_repo.dart';

class MarketCoinRepoImpl extends MarketCoinRepo{

  final ApiService apiService;

  MarketCoinRepoImpl({required this.apiService});


  @override
  Future<ApiResult<List<MarketCoinDto>>> getMarketCoins({int page = 1})async {
     try {
      final response = await apiService.getMarketCoins(page: page.toString());
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }
  
  @override
  Future<ApiResult<SearchResponseDto>> searchCoinByKeyword(String keyword) async{
    try {
      final response = await apiService.getCoinByKeyword(keyword);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }

  
  
}