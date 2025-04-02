t# Theme Folder

The `theme/` folder contains files responsible for managing the app's theming, including colors, typography, and state management.

## Folder Structure

- **`app_theme.dart`**: Defines the app's main theme, including light and dark mode configurations.
- **`theme_cubit.dart`**: Manages theme state using the Cubit state management pattern.

## Usage

### 1. Applying Theme to `MaterialApp`

In your `main.dart`, wrap the `MaterialApp` with a `BlocProvider` for theme management:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app/theme/app_theme.dart';
import 'package:your_app/theme/theme_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          home: HomeScreen(),
        );
      },
    );
  }
}
```

### 2. Switching Themes Dynamically

To change between light and dark themes, use the `ThemeCubit`:

```dart
ElevatedButton(
  onPressed: () {
    context.read<ThemeCubit>().setThemeMode(ThemeMode.light);
  },
  child: Text("Switch Theme"),
)
```

## Notes

- This folder ensures a centralized and scalable approach to theming.
- Theme customization can be done easily by modifying `app_theme.dart`.
- `theme_cubit.dart` is used for dynamically switching themes within the app.

This structure helps in maintaining a consistent UI across the app with easy theme management.
