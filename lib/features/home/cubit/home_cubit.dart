import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/networking/models/api_error_model.dart';
import 'package:crypto_demo/features/home/domain/entities/coin.dart';
import 'package:crypto_demo/features/home/domain/entities/market_overview.dart';
import 'package:crypto_demo/features/home/domain/entities/trending_coin.dart';
import 'package:crypto_demo/features/home/domain/usecases/get_market_overview_usecase.dart';
import 'package:crypto_demo/features/home/domain/usecases/get_top_gainers_usecase.dart';
import 'package:crypto_demo/features/home/domain/usecases/get_trending_coins_usecase.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetMarketOverview getMarketStatUsecase,
    required GetTrendingCoins getTrendingCoinsUsecase,
    required GetTopGainers getTopGainersUsecase,
  }) : _getTopGainersUsecase = getTopGainersUsecase,
       _getTrendingCoinsUsecase = getTrendingCoinsUsecase,
       _getMarketStatUsecase = getMarketStatUsecase,
       super(HomeState.initial());

  final GetMarketOverview _getMarketStatUsecase;
  final GetTrendingCoins _getTrendingCoinsUsecase;
  final GetTopGainers _getTopGainersUsecase;

  Future<void> loadHome() async {
    await Future.wait([
    _loadMarketStats(),
    _loadTrendingCoins(),
    _loadTopGainers(),
  ]);
  }

  Future<void> _loadMarketStats() {
    return _execute(
      task: _getMarketStatUsecase.call,
      emitState: (stateValue) {
        emit(state.copyWith(marketStats: stateValue));
      },
    );
  }

  Future<void> _loadTrendingCoins() {
    return _execute(
      task: _getTrendingCoinsUsecase.call,
      emitState: (stateValue) {
        emit(state.copyWith(trendingCoins: stateValue));
      },
    );
  }

  Future<void> _loadTopGainers() {
    return _execute(
      task: _getTopGainersUsecase.call,
      emitState: (stateValue) {
        emit(state.copyWith(topGainers: stateValue));
      },
    );
  }

  Future<void> _execute<T>({
  required Future<ApiResult<T>> Function() task,
  required void Function(AsyncState<T>) emitState,
}) async {
  emitState( AsyncState<T>(status: LoadStatus.loading));

  final result = await task();
  result.when(
    onSuccess: (data) {
      emitState(AsyncState.success(data));
    },
    onError: (error) {
      emitState(AsyncState.failure(error));
    },
  );
}
}