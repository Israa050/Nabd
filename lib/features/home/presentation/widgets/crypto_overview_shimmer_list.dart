


import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/crypto_card_base.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';

class CryptoOverviewShimmerList extends StatelessWidget {
  const CryptoOverviewShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CryptoOverviewCardShimmer();
      },
    );
  }
}

class CryptoOverviewCardShimmer extends StatelessWidget {
  final double width;
  final double height;

  const CryptoOverviewCardShimmer({
    super.key,
    this.width = 200,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return CryptoOverviewCardBase(
      width: width,
      height: height,
      header: const _HeaderShimmer(),
      priceRow: const _PriceRowShimmer(),
    );
  }
}


class _HeaderShimmer extends StatelessWidget {
  const _HeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topRight,
          child: ShimmerBox(width: 24, height: 24, borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ShimmerBox(width: 80, height: 14),
            SizedBox(height: 4),
            ShimmerBox(width: 40, height: 12),
          ],
        ),
      ],
    );
  }
}

class _PriceRowShimmer extends StatelessWidget {
  const _PriceRowShimmer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        ShimmerBox(width: 60, height: 20),
        SizedBox(width: 8),
        ShimmerBox(width: 40, height: 12),
        SizedBox(width: 6),
        ShimmerBox(width: 12, height: 12),
      ],
    );
  }
}