import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:crypto_demo/core/widgets/decorated_card.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedCard(
      child: BalanceCardContent(),
    );
  }
}

class BalanceCardContent extends StatelessWidget {
  const BalanceCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Current Balance',
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xffF5F8FE).withValues(alpha: 0.7),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.44,
            height: 1.77,
          ),
        ),
        const SizedBox(height: 7),

        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '\$143,421.20',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.44,
              height: 1.77,
            ),
          ),
        ),
        const SizedBox(height: 6),

        const _WeeklyProfitBadge(),
      ],
    );
  }
}

class _WeeklyProfitBadge extends StatelessWidget {
  const _WeeklyProfitBadge();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Weekly Profit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.44,
            height: 1,
          ),
        ),
        const SizedBox(width: 4),

        Container(
          width: 68,
          height: 22,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF324D7E),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Text(
                  '2.35%',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffF5F8FE),
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                  ),
                ),
              ),
              SvgPicture.asset('assets/svgs/arrow.svg'),
            ],
          ),
        ),
      ],
    );
  }
}