

import 'package:crypto_demo/core/networking/api_error_handler.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/home/domain/entities/coin.dart';
import 'package:crypto_demo/features/home/domain/mappers/coin_mapper.dart';
import 'package:crypto_demo/features/home/domain/repositories/home_repo.dart';

class GetTopGainers {
  final HomeRepo homeRepo;

  GetTopGainers({required this.homeRepo});

  Future<ApiResult<List<Coin>>> call() async {
    final result = await homeRepo.getTopGainers();
    return result.when(
      onSuccess: (data){
      return ApiResult.success(data.map(CoinMapper.fromModel).toList());
    }, onError: (error){
      return ApiResult.error(ApiErrorHandler.handle(error));
    });
  }
}