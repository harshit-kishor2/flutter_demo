import 'package:flutter/material.dart';
import 'package:person_plan/core/theme/widget_theme/app_color_scheme.dart';
import 'package:person_plan/core/theme/widget_theme/app_text_theme.dart';

/* -- Light & Dark Elevated Button Themes -- */
class AppButtonTheme {
  AppButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColorScheme.lightColorScheme.primary,
      foregroundColor: AppColorScheme.lightColorScheme.onPrimary,
      disabledBackgroundColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: AppTextTheme.lightTextTheme.bodyLarge,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColorScheme.darkColorScheme.primary,
      foregroundColor: AppColorScheme.darkColorScheme.onPrimary,
      disabledBackgroundColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: AppTextTheme.darkTextTheme.bodyLarge,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    ),
  );
}
