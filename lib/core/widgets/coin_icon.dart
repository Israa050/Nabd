import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:flutter/material.dart';

class CircularCoinIcon extends StatelessWidget {
  final String? iconPath;
  final Color? backgroundColor;
  final bool isOnlineIcon;
  const CircularCoinIcon({
    super.key,
    this.iconPath,
    this.backgroundColor,
    this.isOnlineIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context
          .appColors
          .surfaceContainer, // backgroundColor ?? Color(0xffEDF0F4),
      child: isOnlineIcon
          ? CachedNetworkImage(imageUrl: iconPath!)
          : Image.asset(iconPath ?? 'assets/images/ethereum.png'),
    );
  }
}

class SquaredCoinIcon extends StatelessWidget {
  const SquaredCoinIcon({
    super.key,
    required this.iconPath,
    this.backgroundColor,
    required this.isOnlineIcon,
  });

  final String? iconPath;
  final Color? backgroundColor;
  final bool isOnlineIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appColors.surfaceContainer, // Color(0xffF7F7F7),
      ),
      child: Center(
        child: isOnlineIcon
            ? CachedNetworkImage(imageUrl: iconPath!)
            : Image.asset(iconPath ?? 'assets/images/ethereum.png'),
      ),
    );
  }
}
