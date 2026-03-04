import 'package:flutter/material.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/holding_card.dart';

class HoldingsList extends StatelessWidget {
  HoldingsList({super.key});

  final List<HoldingUiModel> holdings = [
    HoldingUiModel(
      coinName: 'Bitcoin',
      symbol: 'BTC',
      allocationPercentage: '50%',
      amount: '0.05 BTC',
      amountValue: '\$2,262.53',
      profitValue: '+\$145.20',
      profitPercentage: '+6.85%',
      coinIconPath: 'assets/images/bitcoin.png'
    ),
    HoldingUiModel(
      coinName: 'Ethereum',
      symbol: 'ETH',
      allocationPercentage: '30%',
      amount: '1.5 ETH',
      amountValue: '\$3,150.75',
      profitValue: '+\$56.70',
      profitPercentage: '+1.83%',
      coinIconPath: 'assets/images/ethereum.png'
    ),
    HoldingUiModel(
      coinName: 'Litecoin',
      symbol: 'LTC',
      allocationPercentage: '20%',
      amount: '26.3 LTC',
      amountValue: '\$2,503.76',
      profitValue: '+\$120.80',
      profitPercentage: '+5.07%',
      coinIconPath: 'assets/images/litecoin.png'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: holdings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        return HoldingCard(data: holdings[index]);
      },
    );
  }
}
