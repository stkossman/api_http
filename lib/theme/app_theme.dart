import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Colors.black;
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xFFE2FF00);
  static const Color onPrimaryContainer = Colors.black;

  static const Color secondary = Color(0xFF00FF00);
  static const Color onSecondary = Colors.black;
  static const Color secondaryContainer = Color(0xFFFF00FF);
  static const Color onSecondaryContainer = Colors.black;

  static const Color surface = Colors.white;
  static const Color onSurface = Colors.black;
  static const Color surfaceContainerHighest = Color(0xFFD0D0D0);

  static const Color error = Color(0xFFFF0000);
  static const Color onError = Colors.white;
  static const Color errorContainer = Color(0xFFFF0000);
  static const Color onErrorContainer = Colors.white;

  static const Color outline = Colors.black;
  static const Color outlineVariant = Colors.black;

  static const Color scaffoldBackground = Color(0xFFF4F4F0);
  static const Color textBody = Colors.black;
  static const Color textBodySmall = Colors.black87;
}

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceContainerHighest: AppColors.surfaceContainerHighest,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.black, width: 4)),
        titleTextStyle: TextStyle(
          color: AppColors.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w900,
          letterSpacing: 2.0,
          fontFamily: 'Courier',
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.black, width: 3),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
          fontFamily: 'Courier',
        ),
        bodyMedium: TextStyle(
          color: AppColors.textBody,
          height: 1.5,
          fontWeight: FontWeight.bold,
          fontFamily: 'Courier',
        ),
        bodySmall: TextStyle(
          color: AppColors.textBodySmall,
          fontWeight: FontWeight.bold,
          fontFamily: 'Courier',
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.black, width: 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.black, width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.black, width: 4),
        ),
        hintStyle: TextStyle(
          color: AppColors.textBodySmall,
          fontFamily: 'Courier',
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
