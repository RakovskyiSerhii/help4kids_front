import 'dart:ui';

/// Colors constants used in the app
///
/// Please avoid using this class directly in the code.
/// Use `Theme.of(context).colorScheme` or
/// `Theme.of(context).extension<AppColorScheme>()` instead
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Dark theme colors
  static const darkPrimaryColor = Color(0xffa1c867);
  static const primaryPaleColor = Color(0xFFdf9148);
  static const primaryPaleLightColor = Color(0xFFFFF3E0);
  static const darkSecondaryColor = Color(0xFFdf9148);
  static const darkSuccessMainColor = Color(0xFF4CAF50);
  static const darkErrorMainColor = Color(0xFFF44336);
  static const darkAlertMainColor = Color(0xFFFFC107);
  static const darkSurfaceColor = Color(0xFF212121);
  static const darkLineColor = Color(0xFF424242);
  static const darkBackgroundColor = Color(0xFF121212);
  static const darkAccentBackgroundColor = Color(0xFF2C2C2C);
  static const darkAccentSecondBackgroundColor = Color(0xFF3A3A3A);
  static const darkTextColor = Color(0xFFFFFFFF);
  static const darkTextSecondaryColor = Color(0xFFB0B0B0);
  static const darkBorderColor = Color(0xFF444444);
  static const darkBrandDisabledColor = Color(0xFF757575);

  // Light theme colors
  static const lightPrimaryColor = Color(0xffa1c867);
  static const lightSecondaryColor = Color(0xFFdf9148);
  static const lightSuccessMainColor = Color(0xFF4CAF50);
  static const lightErrorMainColor = Color(0xFFF44336);
  static const lightAlertMainColor = Color(0xFFFFC107);
  static const lightSurfaceColor = Color(0xFFF5F5F5);
  static const lightLineColor = Color(0xFFEEEEEE);
  static const lightBackgroundColor = Color(0xFFF9FAFB);
  static const lightAccentBackgroundColor = Color(0xFFFFFFFF);
  static const lightAccentSecondBackgroundColor = Color(0xFFF2F2F2);
  static const lightTextColor = Color(0xFF0F0F0F);
  static const lightTextSecondaryColor = Color(0xFF6A6A6A);
  static const lightBorderColor = Color(0xFFF2F4F7);
  static const lightBrandDisabledColor = Color(0xFFBDBDBD);

  // Palette colors
  static const paletteOrange800Color = Color(0xFFBF360C);
  static const paletteDarkGreyColor = Color(0xFF424242);
  static const paletteGray600Color = Color(0xFF757575);

  static const shadowColor = Color(0xFF101828);
}