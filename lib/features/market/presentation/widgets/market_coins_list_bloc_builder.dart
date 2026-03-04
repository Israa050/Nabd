import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/utils/cubit/pagination_state.dart';
import 'package:crypto_demo/features/home/presentation/widgets/shimmer_coins_list.dart';
import 'package:crypto_demo/features/market/cubit/market_coin_cubit.dart';
import 'package:crypto_demo/features/market/domain/entities/market_coin.dart';
import 'package:crypto_demo/features/market/presentation/widgets/market_coins_list.dart';

class MarketCoinsListBlocBuilder extends StatefulWidget {
  const MarketCoinsListBlocBuilder({super.key});

  @override
  State<MarketCoinsListBlocBuilder> createState() =>
      _MarketCoinsListBlocBuilderState();
}

class _MarketCoinsListBlocBuilderState
    extends State<MarketCoinsListBlocBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<MarketCoinCubit>().loadInitial();
  }

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<MarketCoinCubit, PaginationState<MarketCoin>>(
  builder: (context, state) {
    final cubit = context.read<MarketCoinCubit>();
    final isSearching =
        cubit.currentSearchQuery != null && cubit.currentSearchQuery!.isNotEmpty;

    final coinsList = isSearching ? cubit.searchResults : state.items;

    // 1️⃣ Initial loading (shimmer)
    if (state.isLoading && coinsList.isEmpty) {
      return const CoinListTileShimmerList();
    }

    // 2️⃣ Error on first load
    if (state.error != null && coinsList.isEmpty) {
      return SliverToBoxAdapter(
  child: SizedBox(
    height: 300, // controls vertical centering space
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/loading.png',
          height: 150,
          width: 150,
        ),
        const SizedBox(height: 16),
        const Text(
          'Loading market data...',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
    }

    // 3️⃣ No results for search
    if (isSearching && coinsList.isEmpty) {
      return  SliverToBoxAdapter(
  child: SizedBox(
    height: 300, // controls vertical centering space
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/find.png',
          height: 150,
          width: 150,
        ),
        const SizedBox(height: 16),
        const Text(
          'Loading market data...',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);
    }

    // 4️⃣ Success state (data available)
    return MarketCoinsList(
      coins: coinsList,
      isLoadingMore: isSearching ? false : state.isLoadingMore,
      hasMore: isSearching ? false : state.hasMore,
      onLoadMore: isSearching
          ? null
          : () {
              context.read<MarketCoinCubit>().loadMore();
            },
    );
  },
);
  }
}
