
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/widgets/app_bar_title_widget.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/payment_method_body.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitleWidget(title: AppConstants.paymentMethod,isTitleCentered: true,),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PaymentMethodBody(),
    );
  }
}