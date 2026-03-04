
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';

class HighestPointChartShimmer extends StatelessWidget {
  const HighestPointChartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Stack(
          children: [
            /// fake horizontal grid lines
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (_) => const ShimmerBox(
                  width: double.infinity,
                  height: 1,
                ),
              ),
            ),

            /// fake chart line
            Align(
              alignment: Alignment.center,
              child: ShimmerBox(
                width: double.infinity,
                height: 3,
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            /// fake highest point dot
            Positioned(
              right: 48,
              top: 36,
              child: const ShimmerBox(
                width: 12,
                height: 12,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}