
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/widgets/app_bar_title_widget.dart';
import 'package:crypto_demo/features/payment/presentation/widgets/buy_crypto_body.dart';

class BuyCryptoScreen extends StatelessWidget {
  const BuyCryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitleWidget(title: AppConstants.buyCrypto,isTitleCentered: true,),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BuyCryptoBody(),
    );
  }
}