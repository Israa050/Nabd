import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class ExchangeFeeCard extends StatelessWidget {
  const ExchangeFeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.typography;

    return Row(
      children: [
        // Left Card: Exchange Fee Details
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: colors.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // Icon Box
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffFF8F50), // Orange background
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/dolar.png',
                    width: 20,
                    height: 20,
                    color: context.appColors.surfaceContainer, // Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                // Text Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exchange fee',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff949494),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '0.05%',
                      style: typography.titleMedium.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 16),

        // Right Card: Cost
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Text(
            '\$26',
            style: typography.headlineLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
