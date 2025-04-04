import 'package:flutter/material.dart';

import 'package:person_plan/core/ui/app_button.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/profile_avatar.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final bool showSubmitButton;
  const HomeHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showSubmitButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(
        top: viewPadding.top + 10,
        left: 12,
        right: 12,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: ([
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showBackButton)
            IconButton(
              icon: Icon(
                size: 34,
                Icons.chevron_left,
                color: theme.colorScheme.onSurface,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          else
            GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: ProfileAvatar(
                radius: 24,
                photoUrl: '',
              ),
            ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          if (showSubmitButton)
            AppButton(
              onTap: () {
                // Add your submit functionality here
              },
              width: 100,
              text: 'Submit',
            )
          else
            SizedBox(width: 50),
        ],
      ),
    );
  }
}
