import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_plan/core/screens/page_not_found.dart';
import 'package:person_plan/core/screens/splash_screen.dart';
import 'package:person_plan/features/authentication/presentation/pages/login_screen.dart';

import 'gorouter_observer.dart';
import 'route_const.dart';

// Define the navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// Define the default lifecycle observer (example implementation)
final NavigatorObserver defaultLifecycleObserver = NavigatorObserver();

// Configure GoRouter
final GoRouter routerConfig = GoRouter(
  initialLocation: RouteConst.splash, // Start at splash screen
  navigatorKey: navigatorKey, // Global navigator key
  observers: [
    GoRouterObserver(), // Custom observer for logging navigation
    defaultLifecycleObserver, // Default lifecycle observer
  ],
  errorBuilder: (context, state) => const PageNotFound(), // Custom 404 page
  redirect: (context, state) {
    // Prevent infinite redirection by returning null
    return null;
  },
  routes: [
    GoRoute(
      path: RouteConst.splash,
      name: RouteConst.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteConst.login,
      name: RouteConst.login,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
