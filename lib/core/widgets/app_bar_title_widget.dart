import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarTitleWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  bool isTitleCentered;

  AppBarTitleWidget({
    super.key,
    required this.title,
    this.isTitleCentered = false,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: isTitleCentered,
      iconTheme: IconThemeData(
        color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
      ),
      actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
      backgroundColor: Theme.of(
        context,
      ).appBarTheme.backgroundColor, // Color(0xffF5F8FE),
      title: Text(title, style: context.typography.titleLarge),
    );
  }
}
