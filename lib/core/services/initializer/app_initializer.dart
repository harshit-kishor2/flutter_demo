import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/helper/env_config.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/di/injection_container.dart';

part 'bloc_observer.dart';

abstract final class AppInitializer {
  AppInitializer._(); // Private constructor to prevent instantiation

  /// Initializes the app with the specified environment file.
  static Future<void> initializeApp(String envFile) async {
    try {
      // Set Screen Orientation
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // Initialize Bloc Observer
      Bloc.observer = _MyBlocObserver();

      // Load environment variables based on the passed environment file
      await EnvConfig.load(envFile);

      // Initialize service locator for dependency injection
      await initializeServiceLocater();
    } catch (e) {
      printError('Error during app initialization: $e');
    }
  }

  /// Handles application-level errors and logs them.
  static void handleRunZonedError(Object error, StackTrace stackTrace) {
    printError('Error during app initialization: $error');
    printError('Stack trace: $stackTrace');

    // Uncomment to use Firebase Crashlytics
    // FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
  }
}
