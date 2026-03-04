
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/market_state_grid.dart';
import 'package:crypto_demo/features/home/presentation/widgets/market_state_card_shimmer.dart';

class MarketStateRowShimmer extends StatelessWidget {
  const MarketStateRowShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return MarketStateGrid(
      cardBuilder: (_) =>  MarketStatCardShimmer(
        backgroundColor: context.appColors.surfaceContainer
        // Color(0xffF5F6FA),
      ),
    );
  }
}
