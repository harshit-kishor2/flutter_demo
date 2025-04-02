import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/color_const.dart';

/// A utility class that provides light and dark text themes for the app.
/// This class cannot be instantiated.
class AppTextTheme {
  AppTextTheme._(); // Private constructor to prevent instantiation

  /// Light Theme Text Styles
  static final TextTheme lightTextTheme = TextTheme(
    headlineLarge: _style(32, FontWeight.bold, ColorConst.textLight),
    headlineMedium: _style(28, FontWeight.w600, ColorConst.textLight),
    headlineSmall: _style(22, FontWeight.w600, ColorConst.textLight),
    titleLarge: _style(20, FontWeight.w600, ColorConst.textLight),
    titleMedium: _style(18, FontWeight.w500, ColorConst.textLight),
    titleSmall: _style(18, FontWeight.w400, ColorConst.textLight),
    bodyLarge: _style(16, FontWeight.w500, ColorConst.textLight),
    bodyMedium: _style(16, FontWeight.normal, ColorConst.textLight), // Default font size
    bodySmall: _style(14, FontWeight.w500, ColorConst.textLight.withValues(alpha: 0.5)),
    labelLarge: _style(14, FontWeight.w500, ColorConst.textLight),
    labelMedium: _style(12, FontWeight.normal, ColorConst.textLight),
    labelSmall: _style(10, FontWeight.normal, ColorConst.textLight.withValues(alpha: 0.5)),
  );

  /// Dark Theme Text Styles
  static final TextTheme darkTextTheme = TextTheme(
    headlineLarge: _style(32, FontWeight.bold, ColorConst.textDark),
    headlineMedium: _style(28, FontWeight.w600, ColorConst.textDark),
    headlineSmall: _style(22, FontWeight.w600, ColorConst.textDark),
    titleLarge: _style(20, FontWeight.w600, ColorConst.textDark),
    titleMedium: _style(18, FontWeight.w500, ColorConst.textDark),
    titleSmall: _style(18, FontWeight.w400, ColorConst.textDark),
    bodyLarge: _style(16, FontWeight.w500, ColorConst.textDark),
    bodyMedium: _style(16, FontWeight.normal, ColorConst.textDark), // Default font size
    bodySmall: _style(14, FontWeight.w500, ColorConst.textDark.withValues(alpha: 0.5)),
    labelLarge: _style(14, FontWeight.w500, ColorConst.textDark),
    labelMedium: _style(12, FontWeight.normal, ColorConst.textDark),
    labelSmall: _style(10, FontWeight.normal, ColorConst.textDark.withValues(alpha: 0.5)),
  );

  /// Helper method to create a text style with given parameters
  static TextStyle _style(double size, FontWeight weight, Color color) {
    return TextStyle(fontSize: size, fontWeight: weight, color: color);
  }
}
