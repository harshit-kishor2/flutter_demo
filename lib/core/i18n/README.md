# i18n Folder

The `i18n/` folder is responsible for managing the app's localization and internationalization settings.

## Folder Structure

- **`intl/`**: Auto-generated localization files (should be added to `.gitignore`).
- **`l10n/`**: Contains ARB (Application Resource Bundle) files for different languages.
- **`l10n.dart`**: Auto-generated localization helper file (should be added to `.gitignore`).

## Setup and Configuration

To fully set up localization, update the `pubspec.yaml` file with the following dependencies:

```yaml
# For localization
flutter:
  generate: true

dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0

dev_dependencies:
  build_runner: ^2.4.15

flutter_intl:
  enabled: true
  class_name: I18n
  main_locale: en
  arb_dir: lib/core/i18n/l10n
  output_dir: lib/core/i18n
```

## Usage

### 1. Adding Localization Support in `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:your_app/core/i18n/i18n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: I18n.delegate.supportedLocales,
      localizationsDelegates: [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
	  supportedLocales: const AppLocalizationDelegate().supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        return supportedLocales.contains(locale) ? locale : Locale('en');
      },
      home: HomeScreen(),
    );
  }
}
```

### 2. Accessing Localized Strings in Widgets

```dart
import 'package:flutter/material.dart';
import 'package:your_app/core/i18n/i18n.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(I18n.of(context).welcomeMessage)),
      body: Center(child: Text(I18n.of(context).helloWorld)),
    );
  }
}
```

### 3. Adding New Translations

1. Edit the `lib/core/i18n/l10n/app_en.arb` file (for English) and add new keys:

```json
{
	"welcomeMessage": "Welcome to MyApp!",
	"helloWorld": "Hello, World!"
}
```

2. Add corresponding translations in `app_es.arb` (for Spanish):

```json
{
	"welcomeMessage": "¡Bienvenido a MyApp!",
	"helloWorld": "¡Hola, Mundo!"
}
```

3. Run the following command to regenerate localization files:

```sh
flutter pub run build_runner build
```

## Notes

- The `intl/` folder and `l10n.dart` are auto-generated files and should be excluded from version control (`.gitignore`).
- Ensure `flutter pub get` is run after updating `pubspec.yaml`.
- Run `flutter pub run build_runner build` to generate localization files when needed.
- Use the `I18n` class to access localized strings within the app.

This setup enables easy multilingual support and keeps localization files well-structured.
