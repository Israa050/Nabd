
part of 'home_cubit.dart';

class HomeState {
  final AsyncState<MarketOverview> marketStats;
  final AsyncState<List<TrendingCoin>> trendingCoins;
  final AsyncState<List<Coin>> topGainers;

  const HomeState({
    required this.marketStats,
    required this.trendingCoins,
    required this.topGainers,
  });

  factory HomeState.initial() {
    return HomeState(
      marketStats: const AsyncState(),
      trendingCoins: const AsyncState(),
      topGainers: const AsyncState(),
    );
  }

  HomeState copyWith({
    AsyncState<MarketOverview>? marketStats,
    AsyncState<List<TrendingCoin>>? trendingCoins,
    AsyncState<List<Coin>>? topGainers,
  }) {
    return HomeState(
      marketStats: marketStats ?? this.marketStats,
      trendingCoins: trendingCoins ?? this.trendingCoins,
      topGainers: topGainers ?? this.topGainers,
    );
  }
}


enum LoadStatus { initial, loading, success, failure }

class AsyncState<T> {
  final LoadStatus status;
  final T? data;
  final ApiErrorModel? error;

  const AsyncState({
    this.status = LoadStatus.initial,
    this.data,
    this.error,
  });

  factory AsyncState.loading() =>
      const AsyncState(status: LoadStatus.loading);

  factory AsyncState.success(T data) =>
      AsyncState(status: LoadStatus.success, data: data);

  factory AsyncState.failure(ApiErrorModel error) =>
      AsyncState(status: LoadStatus.failure, error: error);
}