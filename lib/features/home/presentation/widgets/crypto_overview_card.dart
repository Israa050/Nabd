import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:crypto_demo/core/widgets/crypto_card_base.dart';
import 'package:crypto_demo/core/widgets/coin_icon.dart';

class CryptoOverviewCard extends StatelessWidget {
  final CryptoOverviewModel data;
  final double width;
  final double height;

  const CryptoOverviewCard({
    super.key,
    required this.data,
    this.width = 220,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return CryptoOverviewCardBase(
      width: width,
      height: height,
      header: _Header(data: data),
      priceRow: _PriceRow(data: data),
    );
  }
}

class _Header extends StatelessWidget {
  final CryptoOverviewModel data;

  const _Header({required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: CircularCoinIcon(iconPath: data.iconPath),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              maxLines: 1,
              style: context.typography.titleSmall.copyWith(overflow: TextOverflow.ellipsis,),
              // const TextStyle(
              //   fontSize: 14,
              //   fontWeight: FontWeight.w500,
              //   color: Color(0xff1E1F4B),
              //   overflow: TextOverflow.ellipsis,
              // ),
            ),
            Text(
              data.symbol,
              style: context.typography.bodyMedium,
              // const TextStyle(
              //   fontSize: 12,
              //   fontWeight: FontWeight.w400,
              //   color: Color(0xff787A8D),
              // ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PriceRow extends StatelessWidget {
  final CryptoOverviewModel data;

  const _PriceRow({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          data.price,
          style: context.typography.headlineLarge,
          //  const TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.w500,
          //   color: Color(0xff1E1F4B),
          // ),
        ),
        Expanded(child: const SizedBox(width: 8)),
        Text(
          data.changePercent,
          style: TextStyle(
            fontSize: 12,
            color: data.isPositive ? Colors.green : Colors.red,
          ),
        ),
        SvgPicture.asset(
          'assets/svgs/arrow.svg',
          colorFilter: ColorFilter.mode(
            data.isPositive ? Colors.green : Colors.red,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}

class CryptoOverviewModel {
  final String name;
  final String symbol;
  final String price;
  final String changePercent;
  final String iconPath;
  final bool isPositive;

  const CryptoOverviewModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercent,
    required this.iconPath,
    required this.isPositive,
  });
}
