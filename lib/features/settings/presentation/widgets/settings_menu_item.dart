import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsMenuItem extends StatelessWidget {
  final SettingsMenuItemModel item;

  const SettingsMenuItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.leadingIconPath != null
          ? SvgPicture.asset(item.leadingIconPath!)
          : Icon(
              item.leadingIcon,
              color: Theme.of(context).appBarTheme.actionsIconTheme!.color,
              size: 24,
            ),
      title: Text(
        item.title,
        style: context.typography.titleMedium.copyWith(
          height: 1.65,
          color: item.titleColor,
        ),
      ),
      trailing:
          item.trailing ??
          SvgPicture.asset(
            'assets/svgs/arrow_right.svg',
            colorFilter: ColorFilter.mode(
              Theme.of(context).appBarTheme.actionsIconTheme!.color!,
              BlendMode.srcIn,
            ),
          ),
      onTap: item.onTap,
    );
  }
}

class SettingsMenuItemModel {
  final String title;
  final String? leadingIconPath;
  final IconData? leadingIcon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? titleColor;

  const SettingsMenuItemModel({
    required this.title,
    this.leadingIconPath,
    this.leadingIcon,
    this.onTap,
    this.trailing,
    this.titleColor,
  }) : assert(
         leadingIconPath != null || leadingIcon != null,
         'Provide either leadingIconPath or leadingIcon',
       );
}
