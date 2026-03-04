import 'package:flutter/widgets.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/transaction_list_tile.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({super.key});

  final List<TransactionModel> transactions = [
    TransactionModel(
      name: 'Buy Bitcoin',
      date: '2 hours ago',
      price: '0.01 BTC',
      change: '-\$452.50',
      isPositive: false,
      iconPath: 'assets/images/buy.png',
    ),
    TransactionModel(
      name: 'Sell Ethereum',
      date: '1 day ago',
      price: '0.5 ETH',
      change: '+\$1,050.25',
      isPositive: true,
      iconPath: 'assets/images/sell.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, index) {
        return TransactionListTile(
          coin: transactions[index],
        );
      },
    );
  }
}