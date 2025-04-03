import 'package:flutter/material.dart';
import 'package:person_plan/core/i18n/l10n.dart';

class OrDivider extends StatelessWidget {
  final double? height;
  final double? verticalPadding;

  const OrDivider({
    super.key,
    this.height = 1.0,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultLineColor = Colors.grey.shade400;
    final defaultTextColor = Colors.grey.shade600;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              color: defaultLineColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              I18n.of(context).or_text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: defaultTextColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: height,
              color: defaultLineColor,
            ),
          ),
        ],
      ),
    );
  }
}
