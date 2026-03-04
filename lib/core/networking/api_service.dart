
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:crypto_demo/features/coin_details/data/models/chart_response_dto.dart';
import 'package:crypto_demo/features/coin_details/data/models/coin_detail_dto.dart';
import 'package:crypto_demo/features/home/data/models/coin_model_dto.dart';
import 'package:crypto_demo/features/home/data/models/global_market_stats_dto.dart';
import 'package:crypto_demo/features/home/data/models/trending_response_dto.dart';
import 'package:crypto_demo/features/market/data/models/market_coin_dto.dart';
import 'package:crypto_demo/features/market/data/models/search_response_dto.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.trending)
  Future<TrendingResponseDto> getTrending();

  @GET(ApiConstants.global)
  Future<MarketGlobalDto> getMarketStatistics();


  @GET('${ApiConstants.markets}?${ApiConstants.vsCurrencyUsd}&${ApiConstants.orderMarketCapDesc}')
  Future<List<CoinModel>> getTopGainers();

  @GET('${ApiConstants.markets}?${ApiConstants.paginatedParams}')
  Future<List<MarketCoinDto>> getMarketCoins(
    {@Query('page') String page = '1' }
  );

  @GET('${ApiConstants.search}?')
  Future<SearchResponseDto> getCoinByKeyword(
    @Query('query') String query
  );

  @GET('${ApiConstants.coinDetails}/{id}')
  Future<CoinDetailDto> getCoinByID(
    {@Path('id') String id = 'ethereum'}
  );

  @GET('coins')
  Future<MarketChartResponseDto> getMarketChart(
    {@Query('id') String id = 'ethereum'}
  );

}