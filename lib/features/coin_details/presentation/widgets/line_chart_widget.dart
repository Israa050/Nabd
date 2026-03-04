import 'package:flutter/material.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/chart_lablels.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/sample_two.dart';

class LineChartWidget extends StatelessWidget {
  final List<PricePoint> prices;
  const LineChartWidget({super.key,required this.prices});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
    
        HighestPointChart(prices: prices,),
    
        SizedBox(height: 16,),
    
        ChartLabels(),
    
      ],
    );
  }
}