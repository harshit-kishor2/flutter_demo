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
  void initState() {
    super.initState();
    context.read<AuthenticationBloc>().add(AppStarted());
  }

  _listenGuestBloc(BuildContext authContext, AuthenticationState authState) {
    if (authState.isSplashEnd) {
      if (authState.isAuthenticated) {
        context.go(RouteConst.home);
      } else {
        context.go(RouteConst.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: _listenGuestBloc,
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
