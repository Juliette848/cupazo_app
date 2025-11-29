import 'package:flutter/material.dart';
import 'colors.dart';

/// Tema de la aplicación
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryYellow,
        onPrimary: AppColors.deepBlack,
        secondary: AppColors.secondaryYellow,
        onSecondary: AppColors.deepBlack,
        error: AppColors.statusError,
        onError: AppColors.pureWhite,
        surface: AppColors.surface,
        onSurface: AppColors.ink,
        surfaceContainerHighest: AppColors.surfaceMuted,
        outline: AppColors.line,
      ),
      scaffoldBackgroundColor: AppColors.surface,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.ink,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryYellow,
        onPrimary: AppColors.deepBlack,
        secondary: AppColors.secondaryYellow,
        onSecondary: AppColors.deepBlack,
        error: AppColors.statusError,
        onError: AppColors.pureWhite,
        surface: AppColors.deepBlack,
        onSurface: AppColors.pureWhite,
        surfaceContainerHighest: AppColors.inkMuted,
        outline: AppColors.inkSoft,
      ),
      scaffoldBackgroundColor: AppColors.deepBlack,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.deepBlack,
        foregroundColor: AppColors.pureWhite,
      ),
    );
  }
}
