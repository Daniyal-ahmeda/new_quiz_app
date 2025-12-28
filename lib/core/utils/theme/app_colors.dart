import 'package:flutter/material.dart';

class AppColors {
  // Primary Blue Palette
  static const Color primary = Color(0xFF1E88E5); // Blue 600
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xFFBBDEFB); // Blue 100
  static const Color onPrimaryContainer = Color(0xFF0D47A1);

  // Secondary
  static const Color secondary = Color(0xFF42A5F5); // Blue 400
  static const Color onSecondary = Colors.white;
  static const Color secondaryContainer = Color(0xFFE3F2FD); // Blue 50
  static const Color onSecondaryContainer = Color(0xFF1565C0);

  // Tertiary
  static const Color tertiary = Color(0xFF1565C0); // Blue 800
  static const Color onTertiary = Colors.white;
  static const Color tertiaryContainer = Color(0xFF90CAF9);
  static const Color onTertiaryContainer = Color(0xFF002171); // Blue 900

  // Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Colors.white;
  static const Color errorContainer = Color(0xFFF9DEDC);
  static const Color onErrorContainer = Color(0xFF410E0B);

  // Background & Surface
  static const Color background = Color(0xFFFFFBFE);
  static const Color onBackground = Color(0xFF1C1B1F);
  static const Color surface = Color(0xFFFFFBFE);
  static const Color onSurface = Color(0xFF1C1B1F);

  // Dark specific overrides can be handled by ColorScheme in AppTheme
}
