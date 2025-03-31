import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:person_plan/core/helper/logger.dart';

abstract final class EnvConfig {
  EnvConfig._();
  static String get developmentEnvFile => 'env/.env.dev';
  static String get stagingEnvFile => 'env/.env.stg';
  static String get productionEnvFile => 'env/.env.prod';

  static Future<void> load(String envFile) async {
    try {
      await dotenv.load(fileName: envFile);
      printLog('Environment variables loaded successfully $envFile');
    } catch (e) {
      printError('Error loading .env file: $e');
    }
  }

  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
  // Add other environment variables as needed
}
