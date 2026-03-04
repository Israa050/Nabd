
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';

class CoinDescriptionShimmer extends StatelessWidget {
  const CoinDescriptionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ShimmerBox(width: 140, height: 18),
        SizedBox(height: 22),
        _DescriptionLine(width: double.infinity),
        SizedBox(height: 8),
        _DescriptionLine(width: double.infinity),
        SizedBox(height: 8),
        _DescriptionLine(width: double.infinity),
        SizedBox(height: 8),
        _DescriptionLine(width: double.infinity),
        SizedBox(height: 8),
        _DescriptionLine(width: 220),
      ],
    );
  }
}

class _DescriptionLine extends StatelessWidget {
  final double width;

  const _DescriptionLine({required this.width});

  @override
  Widget build(BuildContext context) {
    return ShimmerBox(
      width: width,
      height: 16,
      borderRadius: BorderRadius.all(Radius.circular(4)),
    );
  }
}