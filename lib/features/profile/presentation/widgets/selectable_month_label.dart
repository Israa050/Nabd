import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class SelectableMonthLabel extends StatelessWidget {
  const SelectableMonthLabel({
    super.key,
    required this.month,
    required this.isSelected,
    required this.onTap,
  });

  final String month;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected? context.appColors.selectedLabelColor : context.appColors.unselectedLabelColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          month,
          style: context.typography.bodyMedium.copyWith(
            color: isSelected? context.appColors.selectedTextColor : context.appColors.unselectedTextColor,
            height: 1.3
          ),
        ),
      ),
    );
  }
}