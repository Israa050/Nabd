import 'package:crypto_demo/core/theme/app_typography_extension.dart';
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color surfaceContainer;
  final Color marketChangeTextColor;
  final Color selectedLabelColor;
  final Color selectedTextColor;
  final Color unselectedLabelColor;
  final Color unselectedTextColor;
  final Color buttonTextColor;
  final Color buttonBackgroundColor;
  final Color warningTextColor;
  final Color warningBackgroundColor;

  final Color textFormFieldBackgroundColor;
  final Color textFormFieldBorderColor;
  final Color textFormFieldIconColor;
  final Color authEllipseColor;

  AppColors({
    required this.surfaceContainer,
    required this.marketChangeTextColor,
    required this.selectedLabelColor,
    required this.selectedTextColor,
    required this.unselectedLabelColor,
    required this.unselectedTextColor,
    required this.buttonTextColor,
    required this.buttonBackgroundColor,
    required this.warningTextColor,
    required this.warningBackgroundColor,
    required this.textFormFieldBackgroundColor,
    required this.textFormFieldBorderColor,
    required this.textFormFieldIconColor,
    required this.authEllipseColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? surfaceContainer,
    Color? marketChangeTextColor,
    Color? selectedLabelColor,
    Color? selectedTextColor,
    Color? unselectedLabelColor,
    Color? unselectedTextColor,
    Color? buttonTextColor,
    Color? buttonBackgroundColor,
    Color? warningTextColor,
    Color? warningBackgroundColor,
    Color? textFormFieldBackgroundColor,
    Color? textFormFieldBorderColor,
    Color? textFormFieldIconColor,
    Color? authEllipseColor,
  }) {
    return AppColors(
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      marketChangeTextColor:
          marketChangeTextColor ?? this.marketChangeTextColor,
      selectedLabelColor: selectedLabelColor ?? this.selectedLabelColor,
      selectedTextColor: selectedTextColor ?? this.selectedTextColor,
      unselectedLabelColor: unselectedLabelColor ?? this.unselectedLabelColor,
      unselectedTextColor: unselectedTextColor ?? this.unselectedTextColor,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      warningTextColor: warningTextColor ?? this.warningTextColor,
      warningBackgroundColor:
          warningBackgroundColor ?? this.warningBackgroundColor,
      textFormFieldBackgroundColor:
          textFormFieldBackgroundColor ?? this.textFormFieldBackgroundColor,
      textFormFieldBorderColor:
          textFormFieldBorderColor ?? this.textFormFieldBorderColor,
      textFormFieldIconColor:
          textFormFieldIconColor ?? this.textFormFieldIconColor,
      authEllipseColor: authEllipseColor ?? this.authEllipseColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;
    return AppColors(
      surfaceContainer: Color.lerp(
        surfaceContainer,
        other.surfaceContainer,
        t,
      )!,
      marketChangeTextColor: Color.lerp(
        marketChangeTextColor,
        other.marketChangeTextColor,
        t,
      )!,
      selectedLabelColor: Color.lerp(
        selectedLabelColor,
        other.selectedLabelColor,
        t,
      )!,
      selectedTextColor: Color.lerp(
        selectedTextColor,
        other.selectedTextColor,
        t,
      )!,
      unselectedLabelColor: Color.lerp(
        unselectedLabelColor,
        other.unselectedLabelColor,
        t,
      )!,
      unselectedTextColor: Color.lerp(
        unselectedTextColor,
        other.unselectedTextColor,
        t,
      )!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      buttonBackgroundColor: Color.lerp(
        buttonBackgroundColor,
        other.buttonBackgroundColor,
        t,
      )!,
      warningTextColor: Color.lerp(
        warningTextColor,
        other.warningTextColor,
        t,
      )!,
      warningBackgroundColor: Color.lerp(
        warningBackgroundColor,
        other.warningBackgroundColor,
        t,
      )!,
      textFormFieldBackgroundColor: Color.lerp(
        textFormFieldBackgroundColor,
        other.textFormFieldBackgroundColor,
        t,
      )!,
      textFormFieldBorderColor: Color.lerp(
        textFormFieldBorderColor,
        other.textFormFieldBorderColor,
        t,
      )!,
      textFormFieldIconColor: Color.lerp(
        textFormFieldIconColor,
        other.textFormFieldIconColor,
        t,
      )!,
      authEllipseColor: Color.lerp(
        authEllipseColor,
        other.authEllipseColor,
        t,
      )!,
    );
  }
}

extension ThemeX on BuildContext {
  AppTypography get typography => Theme.of(this).extension<AppTypography>()!;

  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
