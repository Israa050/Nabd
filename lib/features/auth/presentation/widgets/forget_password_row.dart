import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class RemebermeAndForgetPasswordRow extends StatelessWidget {
  const RemebermeAndForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
          checkColor: context.appColors.buttonBackgroundColor,
          side: BorderSide(color: context.appColors.selectedLabelColor),
        ),

        SizedBox(width: 4),

        Text(
          'Remeber me',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 18 / 16,
            letterSpacing: 0.0,
            color: context.appColors.unselectedTextColor,
          ),
          textAlign: TextAlign.center,
        ),

        Expanded(child: SizedBox(width: 10)),

        TextButton(
          onPressed: () {},
          child: Text(
            'Forget Password?',
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.0,
              color: context.appColors.selectedLabelColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
