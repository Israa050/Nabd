import 'package:flutter/material.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/finger_print_scaned_body.dart';

class FingerPrintScanedScreen extends StatelessWidget {
  const FingerPrintScanedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FingerPrintScanedBody());
  }
}
