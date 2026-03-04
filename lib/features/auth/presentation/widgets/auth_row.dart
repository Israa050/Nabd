import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class AuthRow extends StatelessWidget {
  const AuthRow({
    super.key,
    required this.message,
    required this.actionMessage,
    required this.onTap,
  });

  final String message;
  final String actionMessage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message, // 'Don’t have an account? ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.0,
            letterSpacing: 0.0,
            color: context.typography.bodyMedium.color,
          ),
          textAlign: TextAlign.center,
        ),

        TextButton(
          onPressed: onTap,
          child: Text(
            actionMessage, //'Sign Up',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.0,
              letterSpacing: 0.0,
              color: context.appColors.selectedLabelColor,
            ),
          ),
        ),
      ],
    );
  }
}
