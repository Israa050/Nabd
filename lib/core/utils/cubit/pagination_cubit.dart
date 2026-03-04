

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/networking/api_result.dart';
import 'package:crypto_demo/core/utils/cubit/pagination_state.dart';
import 'package:crypto_demo/core/utils/pagination.dart';

abstract class PaginationCubit<T>
    extends Cubit<PaginationState<T>> {
  PaginationCubit() : super(PaginationState<T>.initial());

  Future<ApiResult<PagedResponse<T>>> fetchPage(int page);

  Future<void> loadInitial() async {
    emit(PaginationState<T>.initial().copyWith(isLoading: true));

    final result = await fetchPage(1);

    result.when(
      onSuccess: (pageData) {
        emit(
          state.copyWith(
            items: pageData.items,
            page: 2,
            hasMore: pageData.hasMore,
            isLoading: false,
          ),
        );
      },
      onError: (error) {
        emit(
          state.copyWith(
            isLoading: false,
            error: error.errorDetails,
          ),
        );
      },
    );
  }

  Future<void> loadMore() async {
     print('🟡 loadMore CALLED');
  print('   hasMore: ${state.hasMore}');
  print('   isLoadingMore: ${state.isLoadingMore}');
  print('   page: ${state.page}');
  print('   itemsCount: ${state.items.length}');
    if (!state.hasMore || state.isLoadingMore){
          print('🔴 loadMore BLOCKED');
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
      print('🟠 isLoadingMore = true');

    final result = await fetchPage(state.page);

    result.when(
      onSuccess: (pageData) {
          print('🟢 loadMore SUCCESS');
      print('   fetched items: ${pageData.items.length}');
      print('   hasMore: ${pageData.hasMore}');
        emit(
          state.copyWith(
            items: [...state.items, ...pageData.items],
            page: state.page + 1,
            hasMore: pageData.hasMore,
            isLoadingMore: false,
          ),
        );
      },
      onError: (error) {
        print('❌ loadMore ERROR: ${error.errorDetails}');
        emit(
          state.copyWith(
            isLoadingMore: false,
            error: error.errorDetails,
          ),
        );
      },
    );
  }
}