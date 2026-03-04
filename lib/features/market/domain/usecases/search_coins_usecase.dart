
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/utils/pagination.dart';
import 'package:crypto_demo/features/market/domain/entities/market_coin.dart';
import 'package:crypto_demo/features/market/domain/mappers/searched_coin_mapper.dart';
import 'package:crypto_demo/features/market/domain/repositories/market_coin_repo.dart';

class SearchCoinsUsecase {
  final MarketCoinRepo marketCoinRepo;

  SearchCoinsUsecase({required this.marketCoinRepo});

  Future<ApiResult<PagedResponse<MarketCoin>>> call({required String query}) async {
    final ApiResult result =
        await marketCoinRepo.searchCoinByKeyword(query);

    return result.when(
      onSuccess: ( data) {
        final coins = data.coins.map<MarketCoin>(SearchedCoinMapper.fromModel)
            .toList();

        return ApiResult.success(
          PagedResponse<MarketCoin>(
            items: coins,
            hasMore: false, // empty list = no more pages
          ),
        );
      },
      onError: (errorModel) {
        return ApiResult.error(errorModel);
      },
    );
  }
}