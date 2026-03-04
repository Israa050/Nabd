
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';


class CoinDetailsHeaderShimmer extends StatelessWidget {
  const CoinDetailsHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            ShimmerBox(
              width: 40,
              height: 40,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            SizedBox(width: 12),
            ShimmerBox(width: 120, height: 20),
          ],
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ShimmerBox(width: 160, height: 32),
                  SizedBox(height: 8),
                  ShimmerBox(width: 100, height: 14),
                ],
              ),
            ),
            const ShimmerBox(
              width: 70,
              height: 32,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}