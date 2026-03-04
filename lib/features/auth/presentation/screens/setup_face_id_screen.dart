import 'package:crypto_demo/core/storage/app_storage.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_base_page.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SetupFaceIdScreen extends StatelessWidget {
  const SetupFaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SetupFaceIdBody());
  }
}

class SetupFaceIdBody extends StatelessWidget {
  const SetupFaceIdBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 84, 17, 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthHeader(
                  title: 'Set Your Face ID',
                  subTitle:
                      'Add your face ID to make your account\n more secure.',
                ),

                SizedBox(height: 111),

                Image.asset(
                  'assets/images/face_id_blue.png',
                  color: context.appColors.selectedLabelColor,
                ),

                SizedBox(height: 27),

                Text(
                  'Face ID',
                  style: TextStyle(
                    fontSize: 24,
                    height: 1.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    color: context.appColors.selectedLabelColor,
                  ),
                ),

                SizedBox(height: 200),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      width: 162,
                      onTap: () async {
                        await context.read<AuthCubit>().completeBiometrics();
                      },
                      backgroundColor: context.appColors.surfaceContainer,
                      text: 'Skip',
                      boxBorder: Border.all(
                        color: context.appColors.selectedLabelColor,
                        width: 2,
                      ),
                      textStyle: TextStyle(
                        color: context.appColors.selectedLabelColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 19 / 18,
                        letterSpacing: 0.0,
                      ),
                    ),

                    AppButton(
                      width: 162,
                      onTap: () async {
                        context.push('/faceId-scanning');
                      },
                      backgroundColor: context.appColors.buttonBackgroundColor,
                      text: 'continue',
                      textStyle: TextStyle(
                        color: context.appColors.buttonTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 19 / 18,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
