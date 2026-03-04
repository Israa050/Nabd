import 'package:crypto_demo/core/di/dependency_injection.dart';
import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/finger_print_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({super.key});

  @override
  State<FingerPrintScreen> createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
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
            context.go('/verify-account?isFaceId=false');
          } else if (state is BiometricFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Biometric authentication failed')),
            );
          }
        },
        child: FingerPrintBody(),
      ),
    );
  }
}
