# Environment Configuration

The `env/` folder contains environment configuration files that manage different settings for various stages of the application (development, staging, and production).

## Files Overview

- **`.env.dev`** - Environment variables for the development environment.
- **`.env.prod`** - Environment variables for the production environment.
- **`.env.stg`** - Environment variables for the staging environment.
- **`.env.example`** - A template file showcasing the required environment variables (should be used as a reference).

## Usage

1. Copy the `.env.example` file and rename it according to the desired environment, e.g., `.env.dev`.
2. Fill in the necessary values for API keys, base URLs, and other configurations.
3. Ensure that `.env` files are **not committed** to version control by adding them to `.gitignore`.
4. Load environment variables in your app using a package like `flutter_dotenv`.

## Example `.env` File

```env
API_BASE_URL=https://api.example.com
APP_NAME=MyApp
DEBUG=true
FIREBASE_API_KEY=your_firebase_api_key
```

## How to Use in Flutter

### **1. Add `flutter_dotenv` to `pubspec.yaml`**

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_dotenv: ^5.1.0
```

### **2. Load the Environment File in `main.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: 'path_of_your_env');
  runApp(MyApp());
}
```

### **3. Access Environment Variables**

```dart
String apiUrl = dotenv.env['API_BASE_URL'] ?? "https://default.example.com";
String appName = dotenv.env['APP_NAME'] ?? "DefaultApp";
bool isDebug = dotenv.env['DEBUG'] == 'true';
String firebaseApiKey = dotenv.env['FIREBASE_API_KEY'] ?? "";
```

## Using the `EnvConfig` Helper Class

To simplify environment variable management, you can use the `EnvConfig` helper class:

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class EnvConfig {
  EnvConfig._();

  static String get developmentEnvFile => 'env/.env.dev';
  static String get stagingEnvFile => 'env/.env.stg';
  static String get productionEnvFile => 'env/.env.prod';

  static Future<void> load(String envFile) async {
    try {
      await dotenv.load(fileName: envFile);
      debugPrint('Environment variables loaded successfully: $envFile');
    } catch (e) {
      debugPrint('Error loading .env file: $e');
    }
  }

  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
  // Add other environment variables as needed
}
```

### **Usage of `EnvConfig` Class**

```dart
void main() async {
  await EnvConfig.load(EnvConfig.productionEnvFile);
  runApp(MyApp());
}

String firebaseKey = EnvConfig.firebaseApiKey;
```

## Best Practices

- Use `.env.example` as a reference for required environment variables.
- Keep sensitive information **out of the source code** and use environment variables instead.
- Ensure the correct environment file is loaded depending on the app's build configuration.

This setup ensures a flexible and secure way to manage environment-specific configurations.
