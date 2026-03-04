import 'package:flutter/material.dart';
import 'package:crypto_demo/features/auth/presentation/widgets/ellipse_widget.dart';

class AuthBasePage extends StatelessWidget {
  final Widget child;
  const AuthBasePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [EllipseWidget(), child]);
  }
}
