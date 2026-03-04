
import 'package:crypto_demo/core/networking/models/api_error_model.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/coin_details.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/market_chart.dart';

class CoinDetailsState {
  final AsyncState<CoinDetails> coinDetailsState;
  final AsyncState<MarketChart> marketChartState;

  const CoinDetailsState({
    required this.coinDetailsState,
    required this.marketChartState
  });

  factory CoinDetailsState.initial() {
    return CoinDetailsState(
      coinDetailsState: const AsyncState(),
      marketChartState: const AsyncState()
    );
  }

  CoinDetailsState copyWith({
    AsyncState<CoinDetails>? coinDetailsState,
    AsyncState<MarketChart>? marketChartState,
  }) {
    return CoinDetailsState(
      coinDetailsState: coinDetailsState ?? this.coinDetailsState,
      marketChartState:  marketChartState ?? this.marketChartState
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