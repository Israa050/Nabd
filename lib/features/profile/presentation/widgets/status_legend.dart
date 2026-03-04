import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class StatusLegend extends StatelessWidget {
  const StatusLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _StatusLegendItem(color: Color(0xff8979FF), label: '\$54,382.64 BTC'),
        _StatusLegendItem(color: Color(0xffFF928A), label: '\$54,382.64 BTC'),
        _StatusLegendItem(color: Color(0xff3CC3DF), label: '\$54,382.64 BTC'),
      ],
    );
  }
}

class _StatusLegendItem extends StatelessWidget {
  const _StatusLegendItem({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _LegendDot(color: color),
        const SizedBox(width: 10),
        Text(
          label,
          style: context.typography.subtitle,
          // TextStyle(
          //   fontSize: 15,
          //   fontWeight: FontWeight.w700,
          //   letterSpacing: 0.44,
          //   height: 28.25 / 15,
          // ),
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
