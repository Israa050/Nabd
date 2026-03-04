import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_base_page.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_header.dart';
import 'package:go_router/go_router.dart';

class FingerPrintBody extends StatelessWidget {
  const FingerPrintBody({
    super.key,
    this.header,
    this.footer,
    this.hasButton = false,
  });

  final Widget? header;
  final Widget? footer;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 84, 17, 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                header ??
                    AuthHeader(
                      title: 'Touch ID sensor to verify\n yourself',
                      subTitle: '',
                    ),

                SizedBox(height: 157),

                Image.asset(
                  'assets/images/finger_print_big.png',
                  color: context.appColors.selectedLabelColor,
                ),

                SizedBox(height: 148),

                footer ??
                    Text(
                      'Please verify your identity using touch\n ID and it will proceed automatically.',
                      style: TextStyle(
                        fontSize: 18,
                        color: context.appColors.unselectedTextColor,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: 0.0,
                      ),
                      textAlign: TextAlign.center,
                    ),

                SizedBox(height: 59),

                hasButton
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppButton(
                            width: 162,
                            onTap: () async {
                              context.go('/faceId-setup');
                            },
                            text: 'Skip',
                            textStyle: TextStyle(
                              fontSize: 18,
                              color: context.appColors.selectedLabelColor,
                              fontWeight: FontWeight.w700,
                              height: 19 / 18,
                              letterSpacing: 0.0,
                            ),
                            backgroundColor: context.appColors.surfaceContainer,
                            boxBorder: Border.all(
                              color: context.appColors.selectedLabelColor,
                              width: 2,
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
