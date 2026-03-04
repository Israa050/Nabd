
import 'package:crypto_demo/core/networking/api_error_handler.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/networking/api_service.dart';
import 'package:crypto_demo/features/coin_details/data/models/chart_response_dto.dart';
import 'package:crypto_demo/features/coin_details/data/models/coin_detail_dto.dart';
import 'package:crypto_demo/features/coin_details/domain/repositories/coin_details_repo.dart';

class CoinDetailsRepoImpl extends CoinDetailsRepo{

  final ApiService apiService;

  CoinDetailsRepoImpl({required this.apiService});


  @override
  Future<ApiResult<CoinDetailDto>> getCoinByID({required String id})async {
     try {
      final response = await apiService.getCoinByID(id: id);
      print(response.name);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<MarketChartResponseDto>> getMarketChartData({required String id})async {
     try {
      final response = await apiService.getMarketChart(id: id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.error(ApiErrorHandler.handle(error));
    }
  }
  
}