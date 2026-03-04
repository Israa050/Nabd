// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class HighestPointChart extends StatelessWidget {
//    HighestPointChart({super.key});

//   // ✅ DEFINE EVERYTHING FIRST
//   final spots = buildSpots(prices);
//   final highestIndex = findHighestIndex(prices);

//   late final lineBar = LineChartBarData(
//   spots: spots,
//   isCurved: true,
//   barWidth: 3,
//   preventCurveOverShooting: true,
//   isStrokeCapRound: true,
//   color: Color(0xff1E1F4B),
//   belowBarData: BarAreaData(
//     show: true,
//     gradient: LinearGradient(colors: [
//       Color(0xff1E1F4B),
//       Color(0xff1E1F4B).withValues(alpha: 0.1),
//     ],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     ),
//   ),
//   dotData: FlDotData(
//     show: true,
//     checkToShowDot: (spot, barData) {
//       return spot.x.toInt() == highestIndex;
//     },
//     getDotPainter: (spot, percent, barData, index) {
//       return FlDotCirclePainter(
//         radius: 5,
//         color: Color(0xffF56C2A),
//         strokeWidth: 2,
//         strokeColor: Colors.white,
//       );
//     },
//   ),
// );

//   @override
//   Widget build(BuildContext context) {
//     final highestIndex = findHighestIndex(prices);
//     final spots = buildSpots(prices);

//     return Padding(
//       padding: const EdgeInsets.only(left: 20,right: 20),
//       child: AspectRatio(
//         aspectRatio: 2.0,
//         child: LineChart(
//           LineChartData(
//             gridData: FlGridData(drawVerticalLine: false),
//             borderData: FlBorderData(show: false),

//             titlesData: FlTitlesData(
//                 topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                 leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                 rightTitles: AxisTitles(
//                   sideTitles: SideTitles(showTitles: false),
//                 ),
//                 bottomTitles: AxisTitles(
//                   sideTitles: SideTitles(
//                     reservedSize: 25,
//                     interval: 1,
//                     showTitles: true,
//                   ),
//                 ),
//               ),

//             showingTooltipIndicators: [
//               ShowingTooltipIndicators([
//                 LineBarSpot(
//                   lineBar,
//                   0,
//                   spots[highestIndex],
//                 ),
//               ]),
//             ],

//             lineTouchData: LineTouchData(
//               enabled: false,
//               touchTooltipData: LineTouchTooltipData(
//                 showOnTopOfTheChartBoxArea: true,
//                 tooltipBorderRadius: BorderRadius.circular(50),
//                 getTooltipColor: (LineBarSpot s){ return Color(0xffF56C2A);},
//                 getTooltipItems: (spots) {
//                   return spots.map((spot) {
//                     return LineTooltipItem(
//                       '\$${spot.y.toStringAsFixed(0)}',
//                       const TextStyle(color: Colors.white),
//                     );
//                   }).toList();
//                 },
//               ),
//             ),

//             lineBarsData: [
//               lineBar,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// List<FlSpot> buildSpots(List<PricePoint> prices) {
//   return prices.asMap().entries.map((e) {
//     return FlSpot(e.key.toDouble(), e.value.price);
//   }).toList();
// }

// int findHighestIndex(List<PricePoint> prices) {
//   double max = prices.first.price;
//   int index = 0;

//   for (int i = 1; i < prices.length; i++) {
//     if (prices[i].price > max) {
//       max = prices[i].price;
//       index = i;
//     }
//   }
//   return index;
// }

// class PricePoint {
//   final double price;

//   PricePoint(this.price);
// }

// final prices = <PricePoint>[
//   PricePoint(82000),
//   PricePoint(82500),
//   PricePoint(83000), // 🔺 highest
//   PricePoint(82800),
//   PricePoint(82600),
// ];

import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HighestPointChart extends StatelessWidget {
  const HighestPointChart({super.key, required this.prices});

  final List<PricePoint> prices;

  /// 🛡️ fallback prices when API returns empty data
  static const List<PricePoint> _defaultPrices = [
    PricePoint(1.00),
    PricePoint(1.10),
    PricePoint(1.05),
    PricePoint(1.20),
    PricePoint(1.15),
    PricePoint(1.30),
    PricePoint(1.25),
  ];

  @override
  Widget build(BuildContext context) {
    final effectivePrices = prices.isNotEmpty ? prices : _defaultPrices;

    final highestIndex = findHighestIndex(effectivePrices);
    final spots = buildSpots(effectivePrices);

    final lineBar = LineChartBarData(
      spots: spots,
      isCurved: true,
      barWidth: 3,
      preventCurveOverShooting: true,
      isStrokeCapRound: true,
      color: context.appColors.selectedLabelColor,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            const Color(0xff1E1F4B),
            const Color(0xff1E1F4B).withValues(alpha: 0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      dotData: FlDotData(
        show: true,
        checkToShowDot: (spot, barData) {
          return spot.x.toInt() == highestIndex;
        },
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 5,
            color: const Color(0xffF56C2A),
            strokeWidth: 2,
            strokeColor: Colors.white,
          );
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AspectRatio(
        aspectRatio: 2.0,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(drawVerticalLine: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: 25,
                  interval: 1,
                  showTitles: true,
                ),
              ),
            ),
            showingTooltipIndicators: [
              ShowingTooltipIndicators([
                LineBarSpot(lineBar, 0, spots[highestIndex]),
              ]),
            ],
            lineTouchData: LineTouchData(
              enabled: false,
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                //fitInsideVertically: true,
                // tooltipPadding: const EdgeInsets.symmetric(
                //   horizontal: 8,
                //   vertical: 4,
                // ),
                // tooltipMargin: 8,
                showOnTopOfTheChartBoxArea: true,
                tooltipBorderRadius: BorderRadius.circular(50),
                getTooltipColor: (_) => const Color(0xffF56C2A),
                getTooltipItems: (spots) {
                  return spots.map((spot) {
                    return LineTooltipItem(
                      '\$${spot.y.toStringAsFixed(2)}',
                      const TextStyle(color: Colors.white),
                    );
                  }).toList();
                },
              ),
            ),
            lineBarsData: [lineBar],
          ),
        ),
      ),
    );
  }
}

List<FlSpot> buildSpots(List<PricePoint> prices) {
  return prices.asMap().entries.map((e) {
    return FlSpot(e.key.toDouble(), e.value.price);
  }).toList();
}

int findHighestIndex(List<PricePoint> prices) {
  if (prices.isEmpty) return 0;

  double max = prices.first.price;
  int index = 0;

  for (int i = 1; i < prices.length; i++) {
    if (prices[i].price > max) {
      max = prices[i].price;
      index = i;
    }
  }
  return index;
}

class PricePoint {
  final double price;
  const PricePoint(this.price);
}
