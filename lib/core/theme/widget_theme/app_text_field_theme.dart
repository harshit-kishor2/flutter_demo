import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/color_const.dart';
import 'package:person_plan/core/theme/widget_theme/app_color_scheme.dart';
import 'package:person_plan/core/theme/widget_theme/app_text_theme.dart';

class AppTextFieldTheme {
  AppTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ColorConst.textLight,
    suffixIconColor: ColorConst.textLight,
    fillColor: AppColorScheme.lightColorScheme.surface,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: AppTextTheme.lightTextTheme.labelSmall,
    hintStyle: AppTextTheme.lightTextTheme.labelSmall,
    errorStyle: AppTextTheme.lightTextTheme.labelSmall?.copyWith(color: ColorConst.error),
    floatingLabelStyle: AppTextTheme.lightTextTheme.labelSmall
        ?.copyWith(color: ColorConst.backgroundDark.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: AppColorScheme.lightColorScheme.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: AppColorScheme.lightColorScheme.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: AppColorScheme.lightColorScheme.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: ColorConst.textDark,
    suffixIconColor: ColorConst.textDark,
    fillColor: AppColorScheme.darkColorScheme.surface,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: AppTextTheme.darkTextTheme.labelSmall,
    hintStyle: AppTextTheme.darkTextTheme.labelSmall,
    errorStyle: AppTextTheme.darkTextTheme.labelSmall?.copyWith(color: ColorConst.error),
    floatingLabelStyle: AppTextTheme.darkTextTheme.labelSmall
        ?.copyWith(color: ColorConst.backgroundDark.withValues(alpha: 0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: AppColorScheme.darkColorScheme.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: AppColorScheme.darkColorScheme.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: AppColorScheme.darkColorScheme.error),
    ),
    contentPadding: const EdgeInsets.all(12),
  );
}
