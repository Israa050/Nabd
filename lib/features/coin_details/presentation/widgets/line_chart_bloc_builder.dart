import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_cubit.dart';
import 'package:crypto_demo/features/coin_details/cubit/coin_details_state.dart';
import 'package:crypto_demo/features/coin_details/domain/entities/market_chart.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/line_chart_shimmer.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/line_chart_widget.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/sample_two.dart';

class LineChartBlocBuilder extends StatelessWidget {
  const LineChartBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      CoinDetailsCubit,
      CoinDetailsState,
      AsyncState<MarketChart>
    >(
      selector: (state) => state.marketChartState,
      builder: (context, coinDetailsState) {
        switch (coinDetailsState.status) {
          case LoadStatus.initial:
          case LoadStatus.loading:
            return HighestPointChartShimmer();

          case LoadStatus.failure:
            return Center(
              child: Text('Error ${coinDetailsState.error?.errorDetails}'),
            );

          case LoadStatus.success:
            return LineChartWidget(
              prices: coinDetailsState.data!.chartData
                  .take(10)
                  .map((p) => PricePoint(p.value))
                  .toList(),
            );
        }
      },
    );
  }
}