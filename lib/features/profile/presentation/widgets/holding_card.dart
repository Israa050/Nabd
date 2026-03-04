import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/coin_icon.dart';

class HoldingCard extends StatelessWidget {
  const HoldingCard({
    super.key,
    required this.data,
  });

  final HoldingUiModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.fromLTRB(11, 21, 11, 0),
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainer, // Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HoldingHeader(data: data),
          const SizedBox(height: 12),
          HoldingMetricsRow(data: data),
        ],
      ),
    );
  }
}

class HoldingHeader extends StatelessWidget {
  const HoldingHeader({
    super.key,
    required this.data,
  });

  final HoldingUiModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircularCoinIcon(iconPath: data.coinIconPath, isOnlineIcon: false),
      title: Text(
        data.coinName,
        style: context.typography.titleMedium,
        // const TextStyle(
        //   fontSize: 16,
        //   fontWeight: FontWeight.w700,
        //   color: Color(0xff1D3A70),
        //   height: 1,
        // ),
      ),
      subtitle: Text(
        data.symbol,
        style: context.typography.titleSmall,
         // const TextStyle(
         //   fontSize: 14,
         //   fontWeight: FontWeight.w500,
         //   color: Color(0xff949494),
         //   letterSpacing: 0.02,
         // ),
      ),
      trailing: Text(
        data.allocationPercentage,
        style: context.typography.headlineLarge,
        // const TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w700,
        //   color: Color(0xff1D3A70),
        // ),
      ),
    );
  }
}

class HoldingMetricsRow extends StatelessWidget {
  const HoldingMetricsRow({
    super.key,
    required this.data,
  });

  final HoldingUiModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 65, right: 22),
      child: Row(
        children: [
          HoldingValueColumn(
            topText: data.amount,
            bottomText: data.amountValue,
            topTextColor: context.appColors.selectedLabelColor,
            bottomTextColor: const Color(0xffF67E42),
          ),
          const Spacer(),
          HoldingValueColumn(
            topText: data.profitValue,
            bottomText: data.profitPercentage,
            crossAxisAlignment: CrossAxisAlignment.end,
            topTextColor: const Color(0xff7DDDA4),
            bottomTextColor: const Color(0xff7DDDA4),
          ),
        ],
      ),
    );
  }
}

class HoldingValueColumn extends StatelessWidget {
  const HoldingValueColumn({
    super.key,
    required this.topText,
    required this.bottomText,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.topTextColor = const Color(0xff1E1F4B),
    this.bottomTextColor = const Color(0xff1E1F4B),
  });

  final String topText;
  final String bottomText;
  final CrossAxisAlignment crossAxisAlignment;
  final Color topTextColor;
  final Color bottomTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          topText,
          style: TextStyle(
            fontSize: 14,
            color: topTextColor,
            fontWeight: FontWeight.w500,
            height: 20 / 14,
          ),
        ),
        Text(
          bottomText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: bottomTextColor,
            height: 20 / 14,
          ),
        ),
      ],
    );
  }
}

class HoldingUiModel {
  final String coinName;
  final String symbol;
  final String allocationPercentage;
  final String amount;
  final String amountValue;
  final String profitValue;
  final String profitPercentage;
  final String coinIconPath;

  const HoldingUiModel({
    required this.coinName,
    required this.symbol,
    required this.allocationPercentage,
    required this.amount,
    required this.amountValue,
    required this.profitValue,
    required this.profitPercentage,
    required this.coinIconPath
  });
}