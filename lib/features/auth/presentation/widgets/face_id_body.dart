import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';

class FaceIdBody extends StatelessWidget {
  const FaceIdBody({
    super.key,
    this.header,
    this.footer,
    required this.listener,
    this.scanningPath,
  });

  final Widget? header;
  final Widget? footer;
  final String? scanningPath;
  final void Function(BuildContext, BiometricState) listener;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BiometricCubit, BiometricState>(
      listener: listener,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/faceId.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: (header == null) ? 350 : 100),
          child: Column(
            children: [
              header ?? SizedBox.shrink(),

              header == null ? SizedBox.shrink() : SizedBox(height: 200),

              FaceIdCard(imagePath: scanningPath),

              SizedBox(height: 185),

              footer ??
                  Text(
                    'Please wait until your scanning is\n complete',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class FaceIdCard extends StatelessWidget {
  const FaceIdCard({super.key, this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 158,
        width: 155,
        decoration: BoxDecoration(
          color: context.appColors.surfaceContainer,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath ?? 'assets/images/face_id_blue.png',
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
          ],
        ),
      ),
    );
  }
}
