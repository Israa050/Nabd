import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/coin_details.dart';
import 'package:crypto_demo/features/coin_details/domain/mappers/coin_details_mapper.dart';
import 'package:crypto_demo/features/coin_details/domain/repositories/coin_details_repo.dart';

class GetCoinDetailsUsecase {
  final CoinDetailsRepo coinDetailsRepo;

  GetCoinDetailsUsecase({required this.coinDetailsRepo});

  Future<ApiResult<CoinDetails>> call({required String id}) async {
    final result = await coinDetailsRepo.getCoinByID(id: id);
    return result.when(
      onSuccess: (data) {
        return ApiResult.success(CoinDetailsMapper.fromModel(data));
      },
      onError: (error) {
        return ApiResult.error(error);
      },
    );
  }
}
