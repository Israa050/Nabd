import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class CryptoOverviewCardBase extends StatelessWidget {
  final double width;
  final double height;

  // slots
  final Widget header;
  final Widget priceRow;

  const CryptoOverviewCardBase({
    super.key,
    required this.header,
    required this.priceRow,
    this.width = 200,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 10),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.fromLTRB(19, 22, 14, 22),
        decoration: BoxDecoration(
          color: context.appColors.surfaceContainer, // Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [header, const Spacer(), priceRow],
        ),
      ),
    );
  }
}
