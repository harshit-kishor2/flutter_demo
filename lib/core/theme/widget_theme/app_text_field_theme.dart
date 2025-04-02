import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/color_const.dart';
import 'package:person_plan/core/theme/widget_theme/app_color_scheme.dart';
import 'package:person_plan/core/theme/widget_theme/app_text_theme.dart';

/// A utility class for managing text field themes in both light and dark modes.
/// This class cannot be instantiated.
class AppTextFieldTheme {
  AppTextFieldTheme._(); // Private constructor to prevent instantiation

  /// Common border style for input fields
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 1, color: color),
      );

  /// Light Theme Input Decoration
  static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ColorConst.textLight,
    suffixIconColor: ColorConst.textLight,
    fillColor: AppColorScheme.lightColorScheme.surface,
    labelStyle: AppTextTheme.lightTextTheme.labelSmall,
    hintStyle: AppTextTheme.lightTextTheme.labelSmall,
    errorStyle: AppTextTheme.lightTextTheme.labelSmall?.copyWith(color: ColorConst.error),
    floatingLabelStyle: AppTextTheme.lightTextTheme.labelSmall?.copyWith(
      color: ColorConst.backgroundDark.withValues(alpha: 0.8),
    ),
    border: _border(Colors.grey),
    enabledBorder: _border(Colors.grey),
    focusedBorder: _border(AppColorScheme.lightColorScheme.primary),
    errorBorder: _border(AppColorScheme.lightColorScheme.error),
    focusedErrorBorder: _border(AppColorScheme.lightColorScheme.error),
    contentPadding: const EdgeInsets.all(12),
  );

  /// Dark Theme Input Decoration
  static final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ColorConst.textDark,
    suffixIconColor: ColorConst.textDark,
    fillColor: AppColorScheme.darkColorScheme.surface,
    labelStyle: AppTextTheme.darkTextTheme.labelSmall,
    hintStyle: AppTextTheme.darkTextTheme.labelSmall,
    errorStyle: AppTextTheme.darkTextTheme.labelSmall?.copyWith(color: ColorConst.error),
    floatingLabelStyle: AppTextTheme.darkTextTheme.labelSmall?.copyWith(
      color: ColorConst.backgroundDark.withValues(alpha: 0.8),
    ),
    border: _border(Colors.grey),
    enabledBorder: _border(Colors.grey),
    focusedBorder: _border(AppColorScheme.darkColorScheme.primary),
    errorBorder: _border(AppColorScheme.darkColorScheme.error),
    focusedErrorBorder: _border(AppColorScheme.darkColorScheme.error),
    contentPadding: const EdgeInsets.all(12),
  );
}
