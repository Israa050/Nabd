import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/dark_mode_menu_item.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/settings_menu_item.dart';

class SettingsMenuSection extends StatelessWidget {
  const SettingsMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.settings,
          style: context.typography.titleMedium.copyWith(height: 1.625),
          //  TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w600,
          //   letterSpacing: 0.0,
          //   color: Color(0xff1D3A70),
          //   height: 1.625,
          // ),
        ),

        SizedBox(height: 20),

        SettingsMenuItem(
          item: SettingsMenuItemModel(
            title: AppConstants.language,
            leadingIconPath: 'assets/svgs/language.svg',
          ),
        ),

        SizedBox(height: 20),

        Divider(color: Color(0xff5E5E5E)),

        SizedBox(height: 20),

        DarkModeMenuItem(),

        SizedBox(height: 20),
      ],
    );
  }
}
