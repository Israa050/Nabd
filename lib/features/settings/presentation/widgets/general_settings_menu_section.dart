import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/settings_menu_item.dart';

class GeneralSettingsMenuSection extends StatelessWidget {
  const GeneralSettingsMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.general,
          style: context.typography.titleMedium,
          // TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w600,
          //   letterSpacing: 0.0,
          //   color: Color(0xff1D3A70),
          //   height: 1.625,
          ),

        SizedBox(height: 20),

        SettingsMenuItem(
          item: SettingsMenuItemModel(
            title: AppConstants.myAccount,
            leadingIconPath: 'assets/svgs/person.svg',
          ),
        ),

        SizedBox(height: 20),

        const Divider(),

        SizedBox(height: 20),

        SettingsMenuItem(
          item: SettingsMenuItemModel(
            title: AppConstants.billingAndPayment,
            leadingIconPath: 'assets/svgs/wallet.svg',
          ),
        ),

        SizedBox(height: 20),

        Divider(color: Color(0xff5E5E5E)),

        SizedBox(height: 20),

        SettingsMenuItem(
          item: SettingsMenuItemModel(
            title: AppConstants.faqAndSupport,
            leadingIconPath: 'assets/svgs/info.svg',
          ),
        ),
      ],
    );
  }
}
