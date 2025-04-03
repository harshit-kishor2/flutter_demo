import 'package:flutter/material.dart';

import 'package:person_plan/core/ui/app_button.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/profile_avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return Container(
      decoration: BoxDecoration(
          boxShadow: ([
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.1),
          spreadRadius: 2,
          blurRadius: 2,
          offset: const Offset(0, 2),
        ),
      ])),
      child: Container(
        padding: EdgeInsets.only(
          top: viewPadding.top + 12,
          bottom: 16,
          left: 16,
          right: 12,
        ),
        child: Row(
          children: [
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
                  'Person Plan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            AppButton(
              onTap: () {
                // Add your submit functionality here
              },
              width: 100,
              text: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
