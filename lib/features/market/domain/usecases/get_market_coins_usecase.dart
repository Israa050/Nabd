import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/utils/pagination.dart';
import 'package:crypto_demo/features/market/domain/entities/market_coin.dart';
import 'package:crypto_demo/features/market/domain/mappers/market_coin_mapper.dart';
import 'package:crypto_demo/features/market/domain/repositories/market_coin_repo.dart';

class GetMarketCoinsUsecase {
  final MarketCoinRepo marketCoinRepo;

  GetMarketCoinsUsecase({required this.marketCoinRepo});

  Future<ApiResult<PagedResponse<MarketCoin>>> call({int page = 1}) async {
    final ApiResult result =
        await marketCoinRepo.getMarketCoins(page: page);

    return result.when(
      onSuccess: (data) {
        final coins = data
            .map<MarketCoin>(MarketCoinMapper.fromModel)
            .toList();

        return ApiResult.success(
          PagedResponse<MarketCoin>(
            items: coins,
            hasMore: coins.isNotEmpty, // empty list = no more pages
          ),
        );
      },
      onError: (errorModel) {
        return ApiResult.error(errorModel);
      },
    );
  }
}