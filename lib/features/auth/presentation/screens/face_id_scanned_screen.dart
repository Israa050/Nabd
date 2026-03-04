import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/face_id_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaceIdScannedScreen extends StatelessWidget {
  const FaceIdScannedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FaceIdScannedBody());
  }
}

class FaceIdScannedBody extends StatelessWidget {
  const FaceIdScannedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FaceIdBody(
      listener: (context, state) {},
      scanningPath: 'assets/images/verify.png',
      header: Text(
        'You’re Ready!',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          height: 40 / 26,
          letterSpacing: 0.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      footer: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: AppButton(
          onTap: () async {
            await context.read<AuthCubit>().completeBiometrics();
          },
          text: 'Continue',
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 19 / 18,
            letterSpacing: 0.0,
            color: Color(0xff1D3A70),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
