import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 92,
            width: 92,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile_placeholder.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Sophia Isabella',
            style: context.typography.headlineLarge,
            //  TextStyle(
            //   color: Color(0xff1D3A70),
            //   fontSize: 20,
            //   fontWeight: FontWeight.w700,
            //   height: 1.0,
            //   letterSpacing: 0.0,
            // ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
