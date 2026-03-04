import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
    this.borderRadius,
  });

  final String name;
  final bool isSelected;
  final VoidCallback onTap;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ?context.appColors.selectedLabelColor :context.appColors.unselectedLabelColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 100)),
          
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: TextStyle(
              color: isSelected ?  context.appColors.selectedTextColor : context.appColors.unselectedTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.0,
            ),
            child: Text(name),
          ),
        ),
      ),
    );
  }
}