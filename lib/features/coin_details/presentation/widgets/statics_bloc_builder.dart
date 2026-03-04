import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/utils/extensions.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_cubit.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_state.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/coin_details.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/statics_shimmer_widget.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/statics_widget.dart';

class StaticsBlocBuilder extends StatelessWidget {
  const StaticsBlocBuilder({super.key});

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
            return StaticsWidgetShimmer();

          case LoadStatus.failure:
            return Center(
              child: Text('Error ${coinDetailsState.error?.errorDetails}'),
            );

          case LoadStatus.success:
            return StaticsWidget(
              staticsData: StaticsData(
                currentPrice: coinDetailsState.data!.currentPrice.formattedCurrency,
                marketCap: coinDetailsState.data!.marketCap.formattedCurrency,
                volume: coinDetailsState.data!.totalVolume.formattedCurrency,
                availableSypply: coinDetailsState.data!.availableSupply.formattedNumber,
                maxSupply: coinDetailsState.data!.maxSupply.formattedNumber,
              ),
            );
        }
      },
    );
  }
}
