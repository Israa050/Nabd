import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_demo/core/theme/cubit/app_theme_cubit.dart';
import 'package:crypto_demo/core/utils/app_constants.dart';
import 'package:crypto_demo/features/settings/presentation/widgets/settings_menu_item.dart';

class DarkModeMenuItem extends StatefulWidget {
  const DarkModeMenuItem({super.key});

  @override
  State<DarkModeMenuItem> createState() => _DarkModeMenuItemState();
}

class _DarkModeMenuItemState extends State<DarkModeMenuItem> {
  @override
  Widget build(BuildContext context) {
    return SettingsMenuItem(
      item: SettingsMenuItemModel(
        title: AppConstants.darkMode,
        leadingIconPath: 'assets/svgs/theme.svg',
        trailing: BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, state) {
            // Determine active theme based on either explicit mode or system backup
            final isDarkMode =
                state.themeMode == ThemeMode.dark ||
                (state.themeMode == ThemeMode.system &&
                    Theme.of(context).brightness == Brightness.dark);

            return Switch.adaptive(
              value: isDarkMode,
              onChanged: (value) async {
                await context.read<AppThemeCubit>().changeTheme(value);
              },
              dragStartBehavior: DragStartBehavior.start,
              inactiveThumbColor: Colors.white,
              activeThumbColor: Colors.white,
              activeTrackColor: const Color(0xff1D3A70),
              inactiveTrackColor: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
