import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/app/app.dart';
import 'package:person_plan/core/helper/env_config.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/services/bloc_observer.dart';
import 'package:person_plan/di/injection_container.dart';

// Entry point of the application
Future<void> main() async {
  // Run the application within a zone to catch unhandled errors
  runZonedGuarded(
    () async {
      // Ensure that Flutter bindings are initialized before running the app
      WidgetsFlutterBinding.ensureInitialized();

      // Separate device orientation configuration
      _setDeviceOrientation();

      // Load environment variables
      await EnvConfig.load(EnvConfig.productionEnvFile);

      // Initialize service locator for dependency injection
      await initializeServiceLocater();

      Bloc.observer = MyBlocObserver();

      // Run the application
      runApp(const App());
    },
    (error, stackTrace) {
      // Handle uncaught errors
      _handleRunZonedError(error, stackTrace);
    },
  );
}

Future<void> _setDeviceOrientation() async {
  try {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } catch (e) {
    printError('Error setting device orientation: $e');
  }
}

void _handleRunZonedError(Object error, StackTrace stackTrace) {
  printError('Error during app initialization: $error');
  printError('Stack trace: $stackTrace');
  // Uncomment to use Firebase Crashlytics
  // FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
}
