import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/payment/presentation/screens/payment_method_screen.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/exchange_fee_card.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/transaction_payment_section.dart';

class BuyCryptoBody extends StatelessWidget {
  const BuyCryptoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        children: [
          const TransactionPaymentSection(),

          const SizedBox(height: 32),

          const ExchangeFeeCard(),

          const Spacer(),

          AppButton(
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PaymentMethodScreen(),
                ),
              );
            },
            text: 'Continue',
            width: double.infinity,
            height: 56, // Match standard design heights
            borderRadius: 31,
            backgroundColor: context.appColors.buttonBackgroundColor,
            textStyle: TextStyle(
              fontSize: 18,
              height: 19 / 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.0,
              color: context.appColors.buttonTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
