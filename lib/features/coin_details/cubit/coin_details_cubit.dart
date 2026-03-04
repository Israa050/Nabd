import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_state.dart';
import 'package:crypto_demo/features/coin_details/domain/usecases/get_coin_details_usecase.dart';
import 'package:crypto_demo/features/coin_details/domain/usecases/get_market_chart_usecase.dart';

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  CoinDetailsCubit({
    required String coinId,
    required GetCoinDetailsUsecase getCoinDetailsUsecase,
    required GetMarketChartUsecase getMarketChartUsecase,
  })  : _coinId = coinId,
        _getMarketChartUsecase = getMarketChartUsecase,
        _getCoinDetailsUsecase = getCoinDetailsUsecase,
        super(CoinDetailsState.initial());

  final String _coinId;
  final GetCoinDetailsUsecase _getCoinDetailsUsecase;
  final GetMarketChartUsecase _getMarketChartUsecase;

  Future<void> loadCoinDetails() async {
    await Future.wait([
      _loadMarketChart(),
      _loadMarketDetails(),
    ]);
  }

  Future<void> _loadMarketDetails() {
    return _execute(
      task: () => _getCoinDetailsUsecase.call(id: _coinId),
      emitState: (stateValue) {
        emit(state.copyWith(coinDetailsState: stateValue));
      },
    );
  }

  Future<void> _loadMarketChart() {
    return _execute(
      task: () => _getMarketChartUsecase.call(id: _coinId),
      emitState: (stateValue) {
        emit(state.copyWith(marketChartState: stateValue));
      },
    );
  }

  Future<void> _execute<T>({
    required Future<ApiResult<T>> Function() task,
    required void Function(AsyncState<T>) emitState,
  }) async {
    emitState(AsyncState<T>(status: LoadStatus.loading));

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