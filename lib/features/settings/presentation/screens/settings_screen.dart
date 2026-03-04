
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/core/widgets/app_bar_title_widget.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/settings_screen_body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitleWidget(title: AppConstants.settings,),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Color(0xffF5F8FE),
      body: SettingsScreenBody(),
      //bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}