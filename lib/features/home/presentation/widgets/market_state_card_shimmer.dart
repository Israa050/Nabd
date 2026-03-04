
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';

class MarketStatCardShimmer extends StatelessWidget {
  final Color backgroundColor;

  const MarketStatCardShimmer({
    super.key,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      width: 161,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.fromLTRB(22, 8, 42, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          // title placeholder
          ShimmerBox(
            width: 80,
            height: 14,
          ),

          // value placeholder
          ShimmerBox(
            width: 60,
            height: 20,
          ),

          // change row placeholder
          Row(
            children: [
              ShimmerBox(
                width: 40,
                height: 12,
              ),
              SizedBox(width: 6),
              ShimmerBox(
                width: 12,
                height: 12,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
