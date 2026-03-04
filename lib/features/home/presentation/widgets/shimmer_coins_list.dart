

import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/coin_list_tile_base.dart';
import 'package:crypto_demo/core/widgets/shimmer_box.dart';




class CoinListTileShimmerList extends StatelessWidget {
  const CoinListTileShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        return CoinListTileShimmer();
      },
    );
  }
}

class CoinListTileShimmer extends StatelessWidget {
  const CoinListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CoinListTileBase(
      leading: const _IconShimmer(),
      titleSection: const _TitleSectionShimmer(),
      trailing: const _TrailingSectionShimmer(),
    );
  }
}


class _IconShimmer extends StatelessWidget {
  const _IconShimmer();

  @override
  Widget build(BuildContext context) {
    return const ShimmerBox(
      width: 32,
      height: 32,
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }
}


class _TitleSectionShimmer extends StatelessWidget {
  const _TitleSectionShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ShimmerBox(width: 90, height: 16),
        SizedBox(height: 6),
        ShimmerBox(width: 50, height: 14),
      ],
    );
  }
}

class _TrailingSectionShimmer extends StatelessWidget {
  const _TrailingSectionShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        ShimmerBox(width: 50, height: 14),
        SizedBox(height: 6),
        ShimmerBox(width: 40, height: 12),
      ],
    );
  }
}