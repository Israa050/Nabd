
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/widgets/app_bar_title_widget.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/buttons_bottom_navigation.dart';
import 'package:crypto_demo/features/coin_details/presentation/widgets/coin_details_body.dart';

class CoinDetailsScreen extends StatelessWidget {
  const CoinDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBarTitleWidget(title: AppConstants.coinDetails,isTitleCentered: true,),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Color(0xffF5F8FE),
      body: CoinDetailsBody(),
      bottomNavigationBar: ButtonsBottomNavigation(),
    );
  }
}