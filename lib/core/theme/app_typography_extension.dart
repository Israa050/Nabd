import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle displayTitle;
  final TextStyle bodySmall;
  final TextStyle titleSmall;
  final TextStyle headlineLarge;
  final TextStyle bodyMedium;
  final TextStyle titleMedium;
  final TextStyle titleLarge;
  final TextStyle subtitle;
  final TextStyle headLineMedium;
  final TextStyle displayTitleLarge;

  const AppTypography({
    required this.displayTitle,
    required this.bodySmall,
    required this.titleSmall,
    required this.headlineLarge,
    required this.bodyMedium,
    required this.titleMedium,
    required this.titleLarge,
    required this.subtitle,
    required this.headLineMedium,
    required this.displayTitleLarge,
  });

  @override
  AppTypography copyWith({
    TextStyle? displayTitle,
    TextStyle? bodySmall,
    TextStyle? titleSmall,
    TextStyle? headlineLarge,
    TextStyle? bodyMedium,
    TextStyle? titleMedium,
    TextStyle? titleLarge,
    TextStyle? subtitle,
    TextStyle? headLineMedium,
    TextStyle? displayTitleLarge,
  }) {
    return AppTypography(
      displayTitle: displayTitle ?? this.displayTitle,
      bodySmall: bodySmall ?? this.bodySmall,
      titleSmall: titleSmall ?? this.titleSmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      titleMedium: titleMedium ?? this.titleMedium,
      titleLarge: titleLarge ?? this.titleLarge,
      subtitle: subtitle ?? this.subtitle,
      headLineMedium: headLineMedium ?? this.headLineMedium,
      displayTitleLarge: displayTitleLarge ?? this.displayTitleLarge,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;

    return AppTypography(
      displayTitle: TextStyle.lerp(displayTitle, other.displayTitle, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      headLineMedium: TextStyle.lerp(headLineMedium, other.headLineMedium, t)!,
      displayTitleLarge: TextStyle.lerp(
        displayTitleLarge,
        other.displayTitleLarge,
        t,
      )!,
    );
  }
}
