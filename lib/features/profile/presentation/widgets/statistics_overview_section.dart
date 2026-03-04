import 'package:flutter/material.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/portfolio_pie_chart.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/status_legend.dart';

class StatisticsOverviewSection extends StatelessWidget {
  const StatisticsOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [PortfolioPieChart(), const SizedBox(width: 1), Expanded(child: StatusLegend())],
      ),
    );
  }
}