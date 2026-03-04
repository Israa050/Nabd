import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/coin_list_tile_base.dart';
import 'package:crypto_demo/core/widgets/coin_icon.dart';

class TransactionListTile extends StatelessWidget {
  final TransactionModel coin;

  const TransactionListTile({
    super.key,
    required this.coin,
  });

  @override
  Widget build(BuildContext context) {
    return CoinListTileBase(
      leading: CircularCoinIcon(iconPath: coin.iconPath,isOnlineIcon: false,),
      titleSection: _TitleSection(coin: coin,),
      trailing: _TrailingSection(coin: coin,),
    );
  }
}

class _TitleSection extends StatelessWidget {
   final TransactionModel coin;

  const _TitleSection({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coin.name,
          maxLines: 1,
          style: context.typography.titleMedium.copyWith(height: 1.12,letterSpacing: 0.5,),
          //  const TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w700,
          //   color: Color(0xff1D3A70),
          // ),
        ),
        Text(
          coin.date,
          style: context.typography.bodyMedium,
          // const TextStyle(
          //   fontSize: 14,
          //   fontWeight: FontWeight.w500,
          //   color: Color(0xff949494),
          //   height: 1.7,
          // ),
        ),
      ],
    );
  }
}

class _TrailingSection extends StatelessWidget {
  final TransactionModel coin;

  const _TrailingSection({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          coin.price,
          style: context.typography.bodySmall,
          // const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          coin.change,
          style: TextStyle(
            fontSize: 12,
            color: coin.isPositive
                ? const Color(0xff69D895)
                : Colors.red,
          ),
        ),
      ],
    );
  }
}

class TransactionModel {
  final String name;
  final String date;
  final String price;
  final String change;
  final bool isPositive;
  final String iconPath;

  const TransactionModel({
    required this.name,
    required this.date,
    required this.price,
    required this.change,
    required this.isPositive,
    required this.iconPath,
  });
}