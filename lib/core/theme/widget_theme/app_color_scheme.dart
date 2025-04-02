import 'package:flutter/material.dart';

class AppColorScheme {
  AppColorScheme._();

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: Color(0xFF001eb3),
    onPrimary: Colors.white,
    secondary: Color(0xFFc2003a),
    onSecondary: Colors.white,
    tertiary: Color(0xFFb71f52),
    error: Color(0xFFB00020),
    onError: Colors.white,
    surface: Color(0xFFfbfbfe),
    onSurface: Color(0xFF040316),
    outline: Color(0xFF040316),
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: Color(0xFF4d6aff),
    onPrimary: Colors.black,
    secondary: Color(0xFFff3d77),
    onSecondary: Colors.black,
    tertiary: Color(0xFFe0487b),
    error: Color(0xFFCF6679),
    onError: Colors.black,
    surface: Color(0xFF010104),
    onSurface: Color(0xFFeae9fc),
    outline: Color(0xFFeae9fc),
  );
}
