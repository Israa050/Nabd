import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/auth_header.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/finger_print_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SetupFingerPrintScreen extends StatefulWidget {
  const SetupFingerPrintScreen({super.key});

  @override
  State<SetupFingerPrintScreen> createState() => _SetupFingerPrintScreenState();
}

class _SetupFingerPrintScreenState extends State<SetupFingerPrintScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BiometricCubit>().authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BiometricCubit, BiometricState>(
        listener: (context, state) {
          if (state is BiometricSuccess) {
            print('success');
            context.go('/fingerprint-scanned');
          } else if (state is BiometricFailure) {
            print('error is ${state.toString()}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Biometric authentication failed')),
            );
          }
        },
        child: FingerPrintBody(
          header: AuthHeader(
            title: 'Set Your Finger Print',
            subTitle: 'Add a fingerprint to make your account\n more secure.',
          ),
          footer: Text(
            'Place your finger in fingerprint\n sensor until the icon completely',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 19 / 18,
              letterSpacing: 0.0,
              color: context.appColors.selectedLabelColor.withValues(
                alpha: 0.8,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          hasButton: true,
        ),
      ),
    );
  }
}
