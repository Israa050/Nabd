import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_base_page.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyAccountBody extends StatefulWidget {
  const VerifyAccountBody({super.key, required this.isFaceId});
  final bool isFaceId;

  @override
  State<VerifyAccountBody> createState() => _VerifyAccountBodyState();
}

class _VerifyAccountBodyState extends State<VerifyAccountBody> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AuthBasePage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 84, 17, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                widget.isFaceId
                    ? 'assets/images/verify.png'
                    : 'assets/images/right.png',
              ),
            ),

            SizedBox(height: 21),

            Text(
              widget.isFaceId ? 'Face ID' : 'Fingerprint',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                height: 1.0,
                letterSpacing: 0.0,
                color: context.appColors.selectedLabelColor,
              ),
            ),

            SizedBox(height: 104),

            Text(
              'You’re verified',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                height: 40 / 26,
                letterSpacing: 0.0,
                color: context.appColors.selectedLabelColor,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 22),

            Text(
              'You have been verified your\n information completely. Let’s make transactions!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.0,
                height: 22 / 18,
                color: context.appColors.unselectedTextColor,
              ),
              textAlign: TextAlign.center,
            ),

            Spacer(),

            AppButton(
              text: isLoading ? 'Loading...' : 'Continue',
              onTap: () async {
                if (isLoading) return;
                setState(() {
                  isLoading = true;
                });
                await context.read<AuthCubit>().loginWithStoredCredentials();
                setState(() {
                  isLoading = false;
                });
              },
              textStyle: TextStyle(
                fontSize: 18,
                color: context.appColors.buttonTextColor,
                fontWeight: FontWeight.w700,
                height: 19 / 18,
                letterSpacing: 0.0,
              ),
              backgroundColor: context.appColors.buttonBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
