import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/core/theme/app_typography_extension.dart';
import 'package:crypto_demo/core/theme/base_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffF5F8FE),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffF5F8FE),
      elevation: 0.0,
      actionsIconTheme: IconThemeData(color: Color(0xff1D3A70)),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Color(0xff1D3A70),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: Colors.white),
    extensions: [
      AppColors(
        surfaceContainer: Colors.white,
        marketChangeTextColor: Color(0xff4766F9),
        selectedLabelColor: Color(0xff1D3A70),
        selectedTextColor: Color(0xffEDF9F7),
        unselectedLabelColor: Colors.white,
        unselectedTextColor: Color(0xff1E1F4B),
        buttonTextColor: Colors.white,
        buttonBackgroundColor: Color(0xff1D3A70),
        warningTextColor: Color(0xffFF5A55),
        warningBackgroundColor: Color(0xffFF403B).withValues(alpha: 0.2),
        textFormFieldBackgroundColor: Colors.white,
        textFormFieldBorderColor: Color(0xff1D3A70),
        textFormFieldIconColor: Color(0xff1D3A70),
        authEllipseColor: Color(0xff1D3A70),
      ),
      AppTypography(
        displayTitle: BaseTypography.title.copyWith(color: Color(0xff1F1F1F)),
        bodySmall: BaseTypography.bodySmall.copyWith(color: Color(0xff152C07)),
        titleSmall: BaseTypography.titleSmall.copyWith(
          color: Color(0xff1E1F4B),
        ),
        headlineLarge: BaseTypography.headlineLarge.copyWith(
          color: Color(0xff1E1F4B),
        ),
        bodyMedium: BaseTypography.bodyMedium.copyWith(
          color: Color(0xff787A8D),
        ),
        titleMedium: BaseTypography.titleMedium.copyWith(
          color: Color(0xff1D3A70),
        ),
        titleLarge: BaseTypography.titleLarge.copyWith(
          color: Color(0xff1D3A70),
        ),
        subtitle: BaseTypography.subtitle.copyWith(color: Colors.black),
        headLineMedium: BaseTypography.headLineMedium.copyWith(
          color: Color(0xff1D3A70),
        ),
        displayTitleLarge: BaseTypography.displayTitleLarge.copyWith(
          color: Color(0xff152C07),
        ),
      ),
    ],
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF121212),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff121212),
      elevation: 0.0,
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
    bottomAppBarTheme: BottomAppBarThemeData(color: Color(0xff0D0D0D)),
    extensions: [
      AppColors(
        surfaceContainer: Color(0xff0D0D0D),
        marketChangeTextColor: Color(0xff4766F9),
        selectedLabelColor: Colors.white,
        selectedTextColor: Color(0xff191919),
        unselectedLabelColor: Color(0xff0D0D0D),
        unselectedTextColor: Colors.white,
        buttonTextColor: Colors.black,
        buttonBackgroundColor: Colors.white,
        warningTextColor: Color(0xffFF5A55),
        warningBackgroundColor: Color(0xffFF403B).withValues(alpha: 0.2),
        textFormFieldBackgroundColor: Color(0xFF121212),
        textFormFieldBorderColor: Colors.white,
        textFormFieldIconColor: Colors.white,
        authEllipseColor: Colors.white,
      ),
      AppTypography(
        displayTitle: BaseTypography.title.copyWith(color: Colors.white),
        bodySmall: BaseTypography.bodySmall.copyWith(color: Color(0xffE1F8D3)),
        titleSmall: BaseTypography.titleSmall.copyWith(color: Colors.white),
        headlineLarge: BaseTypography.headlineLarge.copyWith(
          color: Colors.white,
        ),
        bodyMedium: BaseTypography.bodyMedium.copyWith(
          color: Color(0xff787A8D),
        ),
        titleMedium: BaseTypography.titleMedium.copyWith(color: Colors.white),
        titleLarge: BaseTypography.titleLarge.copyWith(color: Colors.white),
        subtitle: BaseTypography.subtitle.copyWith(color: Colors.white),
        headLineMedium: BaseTypography.headLineMedium.copyWith(
          color: Colors.white,
        ),
        displayTitleLarge: BaseTypography.displayTitleLarge.copyWith(
          color: Color(0xffE1F8D3),
        ),
      ),
    ],
  );
}
