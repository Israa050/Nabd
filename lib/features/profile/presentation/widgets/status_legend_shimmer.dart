
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';

class StatusLegendShimmer extends StatelessWidget {
  const StatusLegendShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _StatusLegendShimmerItem(),
        SizedBox(height: 5,),
        _StatusLegendShimmerItem(),
        SizedBox(height: 5,),
        _StatusLegendShimmerItem(),
      ],
    );
  }
}

class _StatusLegendShimmerItem extends StatelessWidget {
  const _StatusLegendShimmerItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _ShimmerDot(),
        SizedBox(width: 10),
        ShimmerBox(
          width: 110,
          height: 16,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ],
    );
  }
}

class _ShimmerDot extends StatelessWidget {
  const _ShimmerDot();

  @override
  Widget build(BuildContext context) {
    return ShimmerBox(
      width: 14,
      height: 14,
      borderRadius: BorderRadius.all(Radius.circular(100)),
    );
  }
}