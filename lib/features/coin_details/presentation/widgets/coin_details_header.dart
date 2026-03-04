

import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/coin_icon.dart';

class CoinDetailsHeader extends StatelessWidget {
  final CoinDetailsModel coin;

  const CoinDetailsHeader({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderRow(coin: coin),
        const SizedBox(height: 32),
        _PriceSection(coin: coin),
        const SizedBox(height: 50),
      ],
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final CoinDetailsModel coin;

  const _HeaderRow({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: coin.id,
          child: CircularCoinIcon(
            iconPath: coin.imageUrl,
            isOnlineIcon: true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            coin.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: context.typography.headLineMedium,
          ),
        ),
      ],
    );
  }
}


class _PriceSection extends StatelessWidget {
  final CoinDetailsModel coin;

  const _PriceSection({
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coin.price,
                style: context.typography.displayTitleLarge,
                // const TextStyle(
                //   fontSize: 32,
                //   fontWeight: FontWeight.w700,
                //   color: Color(0xff152C07),
                // ),
              ),
              const SizedBox(height: 4),
              Text(
                '/ ${coin.rank} ${coin.symbol}',
                style: context.typography.subtitle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff5D5C5D),
                ),
                //  const TextStyle(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w700,
                //   color: Color(0xff5D5C5D),
                // ),
              ),
            ],
          ),
        ),
        PriceChangeBadge(
          change: coin.change,
          isPositive: coin.isPositive,
        ),
      ],
    );
  }
}

class PriceChangeBadge extends StatelessWidget {
  final String change;
  final bool isPositive;

  const PriceChangeBadge({
    super.key,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 70,
      decoration: BoxDecoration(
        color: context.appColors.selectedLabelColor,  //const Color(0xff1D3A70),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            isPositive
                ? 'assets/images/arrow-up-right.png'
                : 'assets/images/arrow-down-right.png',
          ),
          Text(
            change,
            style: context.typography.bodyMedium.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            //  const TextStyle(
            //   fontSize: 12,
            //   fontWeight: FontWeight.w700,
            //   color: Colors.white,
            // ),
          ),
        ],
      ),
    );
  }
}

class CoinDetailsModel {
  final String id;
  final String name;
  final String change;
  final String imageUrl;
  final String price;
  final String rank;
  final String symbol;
  final bool isPositive;

  const CoinDetailsModel({
    required this.id,
    required this.name,
    required this.change,
    required this.imageUrl,
    required this.price,
    required this.rank,
    required this.symbol,
    required this.isPositive,
  });
}