import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/general_settings_menu_section.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/settings_menu_section.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/settings_menu_item.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/user_profile_header.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 23),

            UserProfileHeader(),

            SizedBox(height: 32),

            GeneralSettingsMenuSection(),

            SizedBox(height: 32),

            SettingsMenuSection(),

            SizedBox(height: 32),

            SettingsMenuItem(
              item: SettingsMenuItemModel(
                title: 'Logout',
                leadingIcon: Icons.logout_rounded,
                titleColor: Colors.redAccent,
                trailing: SizedBox.shrink(), // hide the arrow
                onTap: () {
                  context.read<AuthCubit>().logout();
                },
              ),
            ),

            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
