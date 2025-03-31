import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/color_const.dart';
import 'package:person_plan/core/theme/text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorConst.primary,
      scaffoldBackgroundColor: ColorConst.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: ColorConst.primary,
        secondary: ColorConst.accent,
        surface: ColorConst.backgroundLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConst.primary,
        foregroundColor: ColorConst.textDark,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConst.primary,
          foregroundColor: ColorConst.textDark,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.headline1,
        bodyLarge: AppTextStyles.bodyText1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConst.primary, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorConst.primaryDark,
      scaffoldBackgroundColor: ColorConst.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: ColorConst.primaryDark,
        secondary: ColorConst.accent,
        surface: ColorConst.backgroundDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConst.primaryDark,
        foregroundColor: ColorConst.textDark,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConst.primaryDark,
          foregroundColor: ColorConst.textDark,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headline1.copyWith(color: ColorConst.textDark),
        bodyLarge: AppTextStyles.bodyText1.copyWith(color: ColorConst.textDark),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConst.accent, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
