import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          const ColorScheme.light(
            primary: AppColors.mainBlueColor,
            tertiary: AppColors.accentYellow,
          ).copyWith(
            surface: AppColors.lightBackground,
            surfaceContainerHighest: AppColors.lightSurface,
            onSurface: AppColors.lightTextPrimary,
            onSurfaceVariant: AppColors.lightTextSecondary,
          ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          const ColorScheme.dark(
            primary: AppColors.accentGreen,
            tertiary: AppColors.accentYellow,
          ).copyWith(
            surface: AppColors.darkBackground,
            surfaceContainerHighest: AppColors.darkSurface,
            onSurface: AppColors.darkTextPrimary,
            onSurfaceVariant: AppColors.darkTextSecondary,
          ),
    );
  }
}
