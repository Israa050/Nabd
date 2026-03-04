import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_base_page.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:go_router/go_router.dart';

class FingerPrintScanedBody extends StatelessWidget {
  const FingerPrintScanedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 200, 17, 107),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/right.png'),

                SizedBox(height: 106),

                Text(
                  ' Your scanning is complete',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: context.appColors.selectedLabelColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 46),

                Text(
                  'you will be able to sign in by using fingerprint',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: context.appColors.unselectedTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 70.69),

                AppButton(
                  onTap: () async {
                    context.go('/faceId-setup');
                  },
                  backgroundColor: context.appColors.buttonBackgroundColor,
                  text: 'Continue',
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: context.appColors.buttonTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
