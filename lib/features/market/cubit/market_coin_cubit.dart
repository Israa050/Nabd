import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/utils/cubit/pagination_cubit.dart';
import 'package:crypto_demo/core/utils/pagination.dart';
import 'package:crypto_demo/core/utils/debouncer.dart';
import 'package:crypto_demo/features/market/domain/entities/market_coin.dart';
import 'package:crypto_demo/features/market/domain/usecases/get_market_coins_usecase.dart';
import 'package:crypto_demo/features/market/domain/usecases/search_coins_usecase.dart';

class MarketCoinCubit extends PaginationCubit<MarketCoin> {
  final GetMarketCoinsUsecase getMarketCoinsUsecase;
  final SearchCoinsUsecase searchCoinsUsecase;

  final Debouncer _debouncer = Debouncer(milliseconds: 600);

  /// Holds the search results
  List<MarketCoin> searchResults = [];

  /// Current search query
  String? _currentSearchQuery;
  String? get currentSearchQuery => _currentSearchQuery;

  MarketCoinCubit({
    required this.getMarketCoinsUsecase,
    required this.searchCoinsUsecase,
  });

  @override
  Future<ApiResult<PagedResponse<MarketCoin>>> fetchPage(int page) async {
    // Keep original pagination logic
    return await getMarketCoinsUsecase.call(page: page);
  }

  /// Called when user types in the search bar
  void onSearchQueryChanged(String query) {
    _currentSearchQuery = query.trim();

    if (_currentSearchQuery!.isEmpty) {
      // Cancel debounce and reset search results
      _debouncer.cancel();
      searchResults = [];
      emit(state.copyWith()); // trigger rebuild with paginated list
      return;
    }

    // Debounce the search API call
    _debouncer.run(() async {
      final result = await searchCoinsUsecase.call(query: _currentSearchQuery!);

      result.when(
        onSuccess: (coins) {
          searchResults = coins.items; // coins is List<MarketCoin>
          emit(state.copyWith()); // trigger UI rebuild
        },
        onError: (error) {
          searchResults = [];
          emit(state.copyWith()); // trigger UI rebuild
        },
      );
    });
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}