import 'dart:async';

import 'package:flutter/material.dart';
import 'package:person_plan/app/app.dart';
import 'package:person_plan/core/helper/env_config.dart';
import 'package:person_plan/core/services/initializer/app_initializer.dart';

// Entry point of the application
Future<void> main() async {
  // Run the application within a zone to catch unhandled errors
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await AppInitializer.initializeApp(EnvConfig.stagingEnvFile);
      runApp(const App());
    },
    (error, stackTrace) {
      AppInitializer.handleRunZonedError(error, stackTrace);
    },
  );
}
