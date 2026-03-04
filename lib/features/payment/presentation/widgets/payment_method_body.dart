import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/credit_card_section.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/payment_methods_list.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/receipt_row.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/core/widgets/success_dialog.dart';

class PaymentMethodBody extends StatelessWidget {
  const PaymentMethodBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const SizedBox(height: 20),

                const CreditCardSection(),

                const SizedBox(height: 24),

                const PaymentMethodsList(),

                const Spacer(),

                const ReceiptRow(),

                const SizedBox(height: 32),

                AppButton(
                  onTap: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );

                    await Future.delayed(const Duration(seconds: 2));

                    if (context.mounted) {
                      Navigator.pop(context); // Close loading dialog
                      SuccessDialog.show(
                        context,
                        title: 'Payment Successful',
                        message:
                            'Your payment process was completed successfully.',
                        buttonLabel: 'Back to Market',
                        onPressed: () {
                          // Maybe pop twice to go back to previous screen
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  },
                  text: 'Buy',
                  width: double.infinity,
                  height: 56, // Match 'Continue' button height
                  borderRadius: 31,
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    height: 19 / 18,
                    letterSpacing: 0.0,
                    color: context.appColors.buttonTextColor,
                  ),
                  backgroundColor: context.appColors.buttonBackgroundColor,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
