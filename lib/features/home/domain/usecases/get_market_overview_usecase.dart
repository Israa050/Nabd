

import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/home/domain/entities/market_overview.dart';
import 'package:crypto_demo/features/home/domain/mappers/market_overview_mapper.dart';
import 'package:crypto_demo/features/home/domain/repositories/home_repo.dart';

class GetMarketOverview {
  final HomeRepo homeRepo;

  GetMarketOverview({required this.homeRepo});

  Future<ApiResult<MarketOverview>> call() async {
    final result = await homeRepo.getMarketStatistics();
    return result.when(
      onSuccess: (data){
      return ApiResult.success(MarketOverviewMapper.fromDto(data));
    }, onError: (error){
      return ApiResult.error(error);
    });
  }
}