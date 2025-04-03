import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/ui/app_button.dart';
import 'package:person_plan/core/ui/custom_styles.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/profile_avatar.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (authContext, authState) {
              return UserAccountsDrawerHeader(
                accountName: Text(
                  authState.user?.name ?? 'Unknown User',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                accountEmail: Text(
                  authState.user?.email ?? '', // Replace with dynamic email
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                currentAccountPicture: ProfileAvatar(
                  photoUrl: authState.user?.photoUrl,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                ),
              );
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              onTap: () {
                context.read<AuthenticationBloc>().add(LogoutEvent());
              },
              text: 'Logout',
              decoration: CustomStyles.buttonDecoration(theme).copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
