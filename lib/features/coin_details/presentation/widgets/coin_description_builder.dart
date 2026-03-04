import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_cubit.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_state.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/coin_details.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/coin_description_shimmer.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/coin_description_widget.dart';

class CoinDescriptionBuilder extends StatelessWidget {
  const CoinDescriptionBuilder({super.key});

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
            return CoinDescriptionShimmer();

          case LoadStatus.failure:
            return Center(
              child: Text('Error ${coinDetailsState.error?.errorDetails}'),
            );

          case LoadStatus.success:
            return CoinDescriptionWidget(
              coinDescription: CoinDescription(
                name: coinDetailsState.data!.name,
                description: coinDetailsState.data!.description,
              ),
            );
        }
      },
    );
  }
}