import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/core/widgets/coin_icon.dart';

class TransactionPaymentSection extends StatelessWidget {
  const TransactionPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.typography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // You Pay Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _AmountDisplay(label: 'You Pay', amount: '\$1,800.00'),
                  _CurrencyPillSelector(
                    iconPath: 'assets/images/dolar.png',
                    symbol: 'USD',
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Divider with Swap Icon
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    color: const Color(0xff5E5E5E).withValues(alpha: 0.2),
                    thickness: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: colors.surfaceContainer,
                    child: Image.asset(
                      'assets/images/swap.png',
                      width: 24,
                      height: 24,
                      // Ensure the icon responds gracefully to dark mode if possible by checking its brightness,
                      // but it's likely a colored asset so we leave it as is.
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // You Receive Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _AmountDisplay(label: 'You Receive', amount: '0.9876'),
                  _CurrencyPillSelector(
                    iconPath: 'assets/images/ethereum.png',
                    symbol: 'ETH',
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        // Exchange Rate Text below the card
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xffFF5A55),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '1 USD = 0.00078 ETH',
              style: typography.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AmountDisplay extends StatelessWidget {
  const _AmountDisplay({required this.label, required this.amount});

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xff949494),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          amount,
          style: typography.headlineLarge.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _CurrencyPillSelector extends StatelessWidget {
  const _CurrencyPillSelector({required this.iconPath, required this.symbol});

  final String iconPath;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    final typography = context.typography;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularCoinIcon(iconPath: iconPath, isOnlineIcon: false),
          ),
          const SizedBox(width: 8),
          Text(symbol, style: typography.titleMedium.copyWith(fontSize: 14)),
          const SizedBox(width: 8),
          Image.asset(
            'assets/images/arrow_down.png',
            width: 12,
            color: typography.titleMedium.color,
          ),
        ],
      ),
    );
  }
}
