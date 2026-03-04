
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppConstants.recentTransactions,
          style: context.typography.titleMedium.copyWith(height: 1.12,letterSpacing: 0.5,),
          // TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w700,
          //   letterSpacing: 0.5,
          //   color: Color(0xff1D3A70),
          //   height: 1.12,
          // ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}