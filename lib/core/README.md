### Core

The Core folder contains essential configurations, utilities, and services that form the backbone of the application. This folder ensures modularity and reusability across the app.

- **constants/**

  Contains core constants and utilities used throughout the app.

  - `api_const.dart`: API-related constants (e.g., base URLs, endpoints).
  - `app_const.dart`: App related constants (e.g., Version, App name.. ).
  - `color_const.dart`: Color constants for consistent theming.
  - `enum.dart`: Enumerations for app-wide use.
  - `font_const.dart`: Font-related constants (e.g., font sizes, styles).
  - `image_const.dart`: Image asset paths and constants.

- **helper/**

  Utility helpers for common functionalities.

  - `device_info_helper.dart`: Helper for retrieving device information.
  - `env_config.dart`: Environment configuration (e.g., dev, prod settings).
  - `event_state.dart`: State management utilities for events state(Idle,Pending,Suceess, Failed).
  - `extensions.dart`: Dart extensions for added functionality.
  - `logger.dart`: Logging utility for debugging and monitoring.
  - `package_info_helper.dart`: Helper for accessing package information (e.g., app version).
  - `utils.dart`: General-purpose utility functions.

- **screens/**

  Contains the app's common screen widgets.

  - `page_not_found.dart`: A 404-style page for invalid routes.
  - `splash_screen.dart`: The splash screen shown on app startup.

- **services/**

  Handles external services and app-wide dependencies.

  - `bloc_observer.dart`: Custom BLoC observer for debugging BLoC events.
  - `dio_client.dart`: Dio client configuration for API requests.
  - `shared_pref.dart`: Helper for managing shared preferences (local storage).

- **ui/**

  Reusable UI components and widgets.
