import 'package:flutter/material.dart';
import 'package:person_plan/core/ui/custom_styles.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isLoading;
  final bool isDisabled;
  final Widget? icon;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.padding,
    this.height,
    this.width,
    this.decoration,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isButtonEnabled = !isDisabled && onTap != null;

    return GestureDetector(
      onTap: isButtonEnabled ? onTap : null,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? CustomStyles.buttonHeight,
        padding: padding ?? CustomStyles.buttonPadding,
        decoration: decoration?.copyWith(
              color:
                  isButtonEnabled ? decoration?.color : theme.disabledColor.withValues(alpha: 0.6),
            ) ??
            CustomStyles.buttonDecoration(theme).copyWith(
              color:
                  isButtonEnabled ? decoration?.color : theme.disabledColor.withValues(alpha: 0.6),
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              Container(
                height: 16,
                width: 16,
                margin: EdgeInsets.only(right: 8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            else if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: icon,
              ),
            Text(
              text,
              style: textStyle?.copyWith(
                    color: isButtonEnabled
                        ? textStyle?.color
                        : textStyle?.color?.withValues(alpha: 0.6),
                  ) ??
                  theme.textTheme.bodyLarge?.copyWith(
                    color: isButtonEnabled ? Colors.white : Colors.white.withValues(alpha: 0.6),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
