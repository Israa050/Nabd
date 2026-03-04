import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:go_router/go_router.dart';

class LoginSpacer extends StatelessWidget {
  const LoginSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 96,
              child: Divider(
                color: context.appColors.unselectedTextColor.withValues(
                  alpha: 0.2,
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Or login with',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 16 / 12,
                letterSpacing: 0.0,
                color: context.appColors.selectedLabelColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 8),
            SizedBox(
              width: 96,
              child: Divider(
                color: context.appColors.unselectedTextColor.withValues(
                  alpha: 0.2,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.push('/fingerprint');
              },
              child: Image.asset(
                'assets/images/finger_id.png',
                color: context.appColors.selectedLabelColor,
              ),
            ),

            SizedBox(width: 50),

            GestureDetector(
              onTap: () {
                context.push('/faceId');
              },
              child: Image.asset(
                'assets/images/face_id.png',
                color: context.appColors.selectedLabelColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
