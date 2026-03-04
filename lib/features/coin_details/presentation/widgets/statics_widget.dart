import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/statics_row_data.dart';

class StaticsWidget extends StatelessWidget {
  const StaticsWidget({super.key, required this.staticsData});

  final StaticsData staticsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statics',
          style: context.typography.headlineLarge.copyWith(
               height: 24 / 18,
             letterSpacing: 0.0,
          ),
          // TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w600,
          //   height: 24 / 18,
          //   letterSpacing: 0.0,
          //   color: Color(0xff1E1F4B),
          // ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 16),

        StaticsRowData(title: 'Current Price', price: staticsData.currentPrice),
        StaticsRowData(title: 'Market Cap', price: staticsData.marketCap),
        StaticsRowData(title: 'Volume 24h', price: staticsData.volume),
        StaticsRowData(
          title: 'Available Supply',
          price: staticsData.availableSypply,
        ),

        StaticsRowData(title: 'Max Supply', price: staticsData.maxSupply),
      ],
    );
  }
}

class StaticsData {
  final String currentPrice;
  final String marketCap;
  final String volume;
  final String availableSypply;
  final String maxSupply;

  StaticsData({
    required this.currentPrice,
    required this.marketCap,
    required this.volume,
    required this.availableSypply,
    required this.maxSupply,
  });
}
