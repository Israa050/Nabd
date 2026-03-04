import 'package:crypto_demo/core/router/routes.dart';
import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/face_id_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FaceIdScanningScreen extends StatelessWidget {
  const FaceIdScanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FaceIdScanningBody());
  }
}

class FaceIdScanningBody extends StatefulWidget {
  const FaceIdScanningBody({super.key});

  @override
  State<FaceIdScanningBody> createState() => _FaceIdScanningBodyState();
}

class _FaceIdScanningBodyState extends State<FaceIdScanningBody> {
  String verifyPath = 'assets/images/verify.png';

  String scanningPath = 'assets/images/face_id.png';

  @override
  void initState() {
    super.initState();
    context.read<BiometricCubit>().authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return FaceIdBody(
      listener: (context, state) {
        if (state is BiometricSuccess) {
          context.go(Routes.faceIdScanned);
        } else if (state is BiometricFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Biometric authentication failed')),
          );
        }
      },
      header: Text(
        'Place your face ID in face\n scanner until the icon completely',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.0,
          letterSpacing: 0.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      footer: Text(
        'Once your scanning is complete, you will\n be able to sign in by using face ID',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.0,
          letterSpacing: 0.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
