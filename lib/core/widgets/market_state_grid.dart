import 'package:flutter/material.dart';

class MarketStateGrid extends StatelessWidget {
  final Widget Function(MarketStatPosition position) cardBuilder;

  const MarketStateGrid({super.key, required this.cardBuilder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- First Row ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            cardBuilder(MarketStatPosition.marketCap),
            cardBuilder(MarketStatPosition.volume),
          ],
        ),

        const SizedBox(height: 10),

        // --- Second Row ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            cardBuilder(MarketStatPosition.btcDominance),
            cardBuilder(MarketStatPosition.activeCoins),
          ],
        ),
      ],
    );
  }
}

enum MarketStatPosition { marketCap, volume, btcDominance, activeCoins }
