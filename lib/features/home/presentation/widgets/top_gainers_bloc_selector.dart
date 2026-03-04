import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/home/cubit/home_cubit.dart';
import 'package:crypto_demo/features/home/domain/entities/coin.dart';
import 'package:crypto_demo/features/home/presentation/widgets/shimmer_coins_list.dart';
import 'package:crypto_demo/features/home/presentation/widgets/top_gainer_list.dart';

class TopGainersBlocSelector extends StatelessWidget {
  const TopGainersBlocSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, AsyncState<List<Coin>>>(
      selector: (state) => state.topGainers,
      builder: (context, topGainers) {
        return topGainers.when(
          loading: () => CoinListTileShimmerList(),
          success: (data) => TopGainerList(topGainers: data),
          failure: (error) => SizedBox.shrink(),
        );
      },
    );
  }
}
