


import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';

class StaticsWidgetShimmer extends StatelessWidget {
  const StaticsWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ShimmerBox(width: 70, height: 18),
        SizedBox(height: 16),
        _StaticsRowShimmer(),
        _StaticsRowShimmer(),
        _StaticsRowShimmer(),
        _StaticsRowShimmer(),
        _StaticsRowShimmer(),
      ],
    );
  }
}

class _StaticsRowShimmer extends StatelessWidget {
  const _StaticsRowShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: const [
              ShimmerBox(width: 100, height: 12),
              SizedBox(width: 15),
              ShimmerBox(width: 12, height: 12),
              Spacer(),
              ShimmerBox(width: 80, height: 14),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(
            color: Color(0xffE2E3E4),
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
