import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:person_plan/core/helper/event_state.dart';
import 'package:person_plan/core/helper/utils.dart';
import 'package:person_plan/core/ui/app_button.dart';
import 'package:person_plan/core/ui/custom_styles.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:person_plan/features/dashboard/presentation/widgets/profile_avatar.dart';
import 'package:person_plan/routes/route_const.dart';

/// A drawer widget that displays user information and provides logout functionality.
///
/// This widget integrates with the [AuthenticationBloc] to show the current user's
/// details and handle logout actions, navigating to the login screen upon success.
class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  /// Handles the logout action by dispatching a [LogoutEvent] to the [AuthenticationBloc].
  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => dialogContext.pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              dialogContext.pop(true);
              context.read<AuthenticationBloc>().add(LogoutEvent());
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  /// Listens to [AuthenticationState] changes and navigates to the login screen on logout.
  void _authenticationBlocListener(BuildContext context, AuthenticationState state) {
    if (state.logoutEventState is EventSuccessWithMessage) {
      final successState = state.logoutEventState as EventSuccessWithMessage;
      Utils.showSnackBar(context, successState.message);
      context.go(RouteConst.login);
    } else if (state.logoutEventState is EventFailedWithMessage) {
      final errorState = state.logoutEventState as EventFailedWithMessage;
      Utils.showSnackBar(context, errorState.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listenWhen: (previous, current) =>
                previous.logoutEventState != current.logoutEventState,
            listener: _authenticationBlocListener,
            builder: (authContext, authState) {
              return _buildUserHeader(context, authState);
            },
          ),
          const Spacer(),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  /// Builds the user account header with profile information.
  Widget _buildUserHeader(BuildContext context, AuthenticationState state) {
    final theme = Theme.of(context);
    return UserAccountsDrawerHeader(
      accountName: Text(
        state.user?.name ?? 'Unknown User',
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
      accountEmail: Text(
        state.user?.email ?? '',
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
      currentAccountPicture: ProfileAvatar(
        photoUrl: state.user?.photoUrl,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
      ),
    );
  }

  /// Builds the logout button with custom styling.
  Widget _buildLogoutButton(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButton(
        onTap: () => _handleLogout(context),
        text: 'Logout',
        decoration: CustomStyles.buttonDecoration(theme).copyWith(
          color: theme.colorScheme.secondary,
        ),
      ),
    );
  }
}
