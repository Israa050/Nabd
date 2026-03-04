import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class PaymentMethodsList extends StatelessWidget {
  const PaymentMethodsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PaymentMethodCard(title: 'Google Pay', onTap: () {}),
        const SizedBox(height: 16),
        _PaymentMethodCard(title: 'Mobile Banking', onTap: () {}),
      ],
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  const _PaymentMethodCard({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.typography;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: colors.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: typography.titleMedium?.copyWith(fontSize: 16),
              ),
              SvgPicture.asset(
                'assets/svgs/arrow_right.svg',
                colorFilter: ColorFilter.mode(
                  typography.titleMedium.color ?? Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
