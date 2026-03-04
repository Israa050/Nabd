import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/visa_card_widget.dart';

class CreditCardSection extends StatelessWidget {
  const CreditCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.typography;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Credit Card',
                style: typography.titleMedium.copyWith(fontSize: 16),
              ),
              Image.asset(
                'assets/images/arrow_down.png',
                width: 24,
                height: 24,
                color: typography.titleMedium.color,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Provider Tabs
          Row(
            children: [
              Expanded(
                child: _ProviderTab(
                  imagePath: 'assets/images/visa.png',
                  isSelected: true,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ProviderTab(
                  imagePath: 'assets/images/mastercard.png',
                  isSelected: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ProviderTab(
                  imagePath: 'assets/images/apple_pay.png',
                  isSelected: true,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Visa Card
          const VisaCardWidget(),
        ],
      ),
    );
  }
}

class _ProviderTab extends StatelessWidget {
   _ProviderTab({required this.imagePath, required this.isSelected,this.color});

  final String imagePath;
  final bool isSelected;
  Color? color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final bgColor = isSelected
        ? colors.buttonBackgroundColor
        : Theme.of(context).scaffoldBackgroundColor;

    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 18,
          color: color,
          // Apple Pay logo should adjust color based on theme and selection, but using standard image for now
        ),
      ),
    );
  }
}
