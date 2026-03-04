import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: context.appColors.selectedLabelColor,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0.0,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 14),

        Text(
          subTitle,
          style: TextStyle(
            color: context.appColors.unselectedTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 24 / 18,
            letterSpacing: 0.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
