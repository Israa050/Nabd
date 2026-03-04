
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/market_chart.dart';
import 'package:crypto_demo/features/coin_details/domain/mappers/market_chart_mapper.dart';
import 'package:crypto_demo/features/coin_details/domain/repositories/coin_details_repo.dart';

class GetMarketChartUsecase {

  final CoinDetailsRepo coinDetailsRepo;

  GetMarketChartUsecase({required this.coinDetailsRepo});

Future<ApiResult<MarketChart>> call({required String id}) async {
    final result = await coinDetailsRepo.getMarketChartData(id: id);
    return result.when(
      onSuccess: (data) {
        return ApiResult.success(MarketChartMapper.fromModel(data));
      },
      onError: (error) {
        return ApiResult.error(error);
      },
    );
  }
}