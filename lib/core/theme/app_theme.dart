import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/color_const.dart';
import 'package:person_plan/core/constants/font_const.dart';
import 'package:person_plan/core/theme/widget_theme/app_button_theme.dart';
import 'package:person_plan/core/theme/widget_theme/app_color_scheme.dart';
import 'package:person_plan/core/theme/widget_theme/app_text_field_theme.dart';
import 'package:person_plan/core/theme/widget_theme/app_text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: FontConst.robotoFamily,
      primaryColor: AppColorScheme.lightColorScheme.primary,
      scaffoldBackgroundColor: ColorConst.backgroundLight,
      colorScheme: AppColorScheme.lightColorScheme,
      textTheme: AppTextTheme.lightTextTheme,
      inputDecorationTheme: AppTextFieldTheme.lightInputDecorationTheme,
      elevatedButtonTheme: AppButtonTheme.lightElevatedButtonTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: FontConst.robotoFamily,
      primaryColor: AppColorScheme.darkColorScheme.primary,
      scaffoldBackgroundColor: ColorConst.backgroundDark,
      colorScheme: AppColorScheme.darkColorScheme,
      textTheme: AppTextTheme.darkTextTheme,
      inputDecorationTheme: AppTextFieldTheme.darkInputDecorationTheme,
      elevatedButtonTheme: AppButtonTheme.darkElevatedButtonTheme,
    );
  }
}
