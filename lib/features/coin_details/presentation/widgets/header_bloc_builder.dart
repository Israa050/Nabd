import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_cubit.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_state.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/coin_details.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/coin_details_header.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/coin_detials_header_shimmer.dart';

class HeaderBlocBuilder extends StatelessWidget {
  const HeaderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      CoinDetailsCubit,
      CoinDetailsState,
      AsyncState<CoinDetails>
    >(
      selector: (state) => state.coinDetailsState,
      builder: (context, coinDetailsState) {
        switch (coinDetailsState.status) {
          case LoadStatus.initial:
          case LoadStatus.loading:
            return CoinDetailsHeaderShimmer();

          case LoadStatus.failure:
            return Center(
              child: Text('Error ${coinDetailsState.error!.errorTitle}'),
            );

          case LoadStatus.success:
            return CoinDetailsHeader(
              coin: CoinDetailsModel(
                id: coinDetailsState.data!.id,
                name: coinDetailsState.data!.name,
                change: coinDetailsState.data!.priceChange.percent,
                imageUrl: coinDetailsState.data!.image,
                price: coinDetailsState.data!.highestPrice.compact,
                rank: coinDetailsState.data!.rank.toString(),
                symbol: coinDetailsState.data!.symbol,
                isPositive: coinDetailsState.data!.priceChange > 0,
              ),
          );
        }
      },
    );
  }
}