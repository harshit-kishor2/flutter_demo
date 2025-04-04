import 'package:flutter/material.dart';
import 'package:person_plan/core/constants/color_const.dart';

class AuthTextRow extends StatelessWidget {
  const AuthTextRow({
    super.key,
    required this.mainText,
    required this.actionText,
    this.onActionPressed,
  });

  final String mainText;
  final String actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainText,
          style: theme.textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: onActionPressed,
          child: Container(
            margin: const EdgeInsets.only(left: 4.0),
            padding: const EdgeInsets.all(4.0),
            child: Text(
              actionText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: ColorConst.linkColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
