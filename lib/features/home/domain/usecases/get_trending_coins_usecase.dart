

import 'package:crypto_demo/core/networking/api_error_handler.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/home/domain/entities/trending_coin.dart';
import 'package:crypto_demo/features/home/domain/mappers/trending_coin_mapper.dart';
import 'package:crypto_demo/features/home/domain/repositories/home_repo.dart';


class GetTrendingCoins {
  final HomeRepo homeRepo;

  GetTrendingCoins({required this.homeRepo});

  Future<ApiResult<List<TrendingCoin>>> call() async {
    final result = await homeRepo.getTrendingCoins();
    
    return result.when(
      onSuccess: (data){
        return ApiResult.success(data.map(TrendingCoinMapper.fromDto).toList());
      }, 
    onError: (error){
      return ApiResult.error(ApiErrorHandler.handle(error));
    });
  }
}