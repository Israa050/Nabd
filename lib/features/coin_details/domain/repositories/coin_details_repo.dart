
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/coin_details/data/models/chart_response_dto.dart';
import 'package:crypto_demo/features/coin_details/data/models/coin_detail_dto.dart';

abstract class CoinDetailsRepo {

  Future<ApiResult<CoinDetailDto>> getCoinByID(
    {required String id}
  );  

  Future<ApiResult<MarketChartResponseDto>> getMarketChartData(
    {required String id}
  );
}