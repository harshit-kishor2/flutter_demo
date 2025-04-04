import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/helper/env_config.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/services/isar/isar_service.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/di/injection_container.dart';
import 'package:person_plan/firebase_options.dart';

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

      // Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Initialize Bloc Observer
      Bloc.observer = _MyBlocObserver();

      // Load environment variables based on the passed environment file
      await EnvConfig.load(envFile);

      // Initialize service locator for dependency injection
      await initializeServiceLocater();
      await _connectIsar();
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

  static Future<void> _connectIsar() async {
    // Initialize IsarService on app start
    await IsarService.initialize();
    final isarService = IsarService.instanceOrNull;
    if (isarService != null) {
      final user = await isarService.getUserByUid(SharedPrefUtils.getUserID);
      printLog("Connected to database for user: ${user?.name}");
    }
  }
}
