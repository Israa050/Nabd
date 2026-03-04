import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/payment/presentation/screens/buy_crypto_screen.dart';

class ButtonsBottomNavigation extends StatelessWidget {
  const ButtonsBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarTheme.color, //  Colors.white
        ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 11.5, 16, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                onTap: ()async {
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BuyCryptoScreen()),
                  );
                },
                text: 'Sell',
                width: 162,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 16 / 18,
                  letterSpacing: 0.0,
                  color: context.appColors.warningTextColor, // Color(0xffFF403B),
                ),
                backgroundColor: context.appColors.warningBackgroundColor, // Color(0xffFF403B).withValues(alpha: 0.2),
              ),

              AppButton(
                onTap: ()async {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BuyCryptoScreen()),
                  );
                },
                text: 'Buy',
                width: 162,
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 19 / 18,
                  letterSpacing: 0.0,
                  color: context.appColors.buttonTextColor, // Colors.white,
                ),
                backgroundColor: context.appColors.buttonBackgroundColor, // Color(0xff1D3A70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}