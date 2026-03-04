import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/face_id_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FaceIdScreen extends StatefulWidget {
  const FaceIdScreen({super.key});

  @override
  State<FaceIdScreen> createState() => _FaceIdScreenState();
}

class _FaceIdScreenState extends State<FaceIdScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BiometricCubit>().authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FaceIdBody(
        listener: (context, state) {
          if (state is BiometricSuccess) {
            context.push('/verify-account?isFaceId=true');
          } else if (state is BiometricFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Biometric authentication failed')),
            );
          }
        },
        scanningPath: 'assets/images/face_id.png',
      ),
    );
  }
}
