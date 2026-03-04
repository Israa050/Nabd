import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class CoinListTileBase extends StatelessWidget {
  final Widget leading;
  final Widget titleSection;
  final Widget trailing;

  const CoinListTileBase({
    super.key,
    required this.leading,
    required this.titleSection,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.appColors.surfaceContainer, // Colors.white,
      ),
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.all(12.0), child: leading),
          Expanded(child: titleSection),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: trailing,
          ),
        ],
      ),
    );
  }
}
