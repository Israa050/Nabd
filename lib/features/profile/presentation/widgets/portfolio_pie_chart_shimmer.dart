
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';

class PortfolioPieChartShimmer extends StatelessWidget {
  const PortfolioPieChartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = constraints.maxWidth;
                  return ShimmerRing(
                    size: size,
                    strokeWidth: 10,
                  );
                },
              ),
            ),
          ),
          const ShimmerBox(
            width: 90,
            height: 16,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ],
      ),
    );
  }
}

class ShimmerRing extends StatelessWidget {
  const ShimmerRing({
    super.key,
    required this.size,
    this.strokeWidth = 8,
  });

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: strokeWidth,
          ),
        ),
      ),
    );
  }
}