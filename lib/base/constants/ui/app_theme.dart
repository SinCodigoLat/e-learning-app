import 'package:flutter/material.dart';
import 'package:e_learning_app/base/constants/ui/app_colors.dart';
import 'package:e_learning_app/base/constants/ui/app_text_styles.dart';

abstract final class AppTheme {
  const AppTheme._();

  static const fontFamily = 'Urbanist';

  static ThemeData get light {
    final colors = AppColors.lightAppColor;
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.scaffoldColor,
      primaryColor: colors.primary500,
      colorScheme: ColorScheme.light(
        primary: colors.primary500,
        secondary: colors.secondary500,
        surface: colors.otherWhite,
        background: colors.scaffoldColor,
        error: colors.error,
        onPrimary: colors.otherWhite,
        onSecondary: colors.greyscale900,
        onSurface: colors.greyscale900,
        onBackground: colors.greyscale900,
        onError: colors.otherWhite,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.otherWhite,
        foregroundColor: colors.greyscale900,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: colors.otherWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        indicatorColor: colors.primary500,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle:
            AppTextStyles.bodyXLargeSemiBold.copyWith(color: colors.primary500),
        unselectedLabelStyle: AppTextStyles.bodyXLargeSemiBold
            .copyWith(color: colors.greyscale500),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: colors.primary500),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  static ThemeData get dark {
    final colors = AppColors.darkAppColor;
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colors.scaffoldColor,
      primaryColor: colors.primary500,
      colorScheme: ColorScheme.dark(
        primary: colors.primary500,
        secondary: colors.secondary500,
        surface: colors.greyscale100,
        background: colors.scaffoldColor,
        error: colors.error,
        onPrimary: colors.greyscale900,
        onSecondary: colors.greyscale900,
        onSurface: colors.greyscale900,
        onBackground: colors.greyscale900,
        onError: colors.otherWhite,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.greyscale100,
        foregroundColor: colors.greyscale900,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: colors.greyscale100,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        indicatorColor: colors.primary500,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle:
            AppTextStyles.bodyXLargeSemiBold.copyWith(color: colors.primary500),
        unselectedLabelStyle: AppTextStyles.bodyXLargeSemiBold
            .copyWith(color: colors.greyscale500),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: colors.primary500),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
