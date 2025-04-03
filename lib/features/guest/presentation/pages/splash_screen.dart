import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:person_plan/features/guest/presentation/widgets/app_image.dart';
import 'package:person_plan/features/guest/presentation/widgets/app_version.dart';
import 'package:person_plan/routes/route_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  /// Initializes the [AuthenticationBloc] with an [AppStarted] event.
  ///
  /// This starts the authentication process.
  @override
  void initState() {
    super.initState();
    // Start the authentication process
    context.read<AuthenticationBloc>().add(AppStarted());
  }

  /// Listens to authentication state changes.
  ///
  /// Navigates to the appropriate page based on the authentication state.
  /// If the splash screen has ended and the user is authenticated, navigates to the home page.
  /// Otherwise, navigates to the login page.
  void _listenAuthenticationBloc(BuildContext authContext, AuthenticationState authState) {
    // Check if the splash screen has ended
    if (authState.isSplashEnd) {
      // Navigate based on the authentication status
      if (authState.isAuthenticated) {
        context.go(RouteConst.home); // Navigate to home page
      } else {
        context.go(RouteConst.login); // Navigate to login page
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: _listenAuthenticationBloc,
        child: Stack(
          children: [
            AppImage(),
            AppVersion(),
          ],
        ),
      ),
    );
  }
}
