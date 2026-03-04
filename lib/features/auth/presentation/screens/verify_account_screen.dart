import 'package:flutter/material.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/verify_account_body.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key, required this.isFaceId});
  final bool isFaceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: VerifyAccountBody(isFaceId: isFaceId));
  }
}
