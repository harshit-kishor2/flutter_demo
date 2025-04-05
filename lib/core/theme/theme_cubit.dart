import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme(); // Load saved theme asynchronously
  }

  // Set a specific theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    emit(mode);
    await SharedPrefUtils.setIsDarkMode(mode == ThemeMode.dark);
  }

  // Load theme from SharedPreferences with fallback
  Future<void> _loadTheme() async {
    try {
      final isDark = SharedPrefUtils.isDark;
      emit(isDark ? ThemeMode.dark : ThemeMode.light);
    } catch (e) {
      emit(ThemeMode.light); // Fallback to default on error
    }
  }
}
