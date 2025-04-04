import 'package:flutter/material.dart';

abstract final class CustomStyles {
  /// The height of a button (48).
  static double get buttonHeight => 48.0;

  /// The padding of a button.
  /// The vertical padding is 8.0, and the horizontal padding is 12.0.
  static EdgeInsets get buttonPadding => EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      );

  /// The decoration of a button.
  /// The button has a border and a shadow.
  static BoxDecoration buttonDecoration(ThemeData theme) => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: theme.colorScheme.outline,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      );
  static BoxDecoration buttonDecorationOutlined(ThemeData theme) =>
      buttonDecoration(theme).copyWith(
        color: theme.colorScheme.surface,
      );
}
