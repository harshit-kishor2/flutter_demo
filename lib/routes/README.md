# Routes Configuration

The `routes/` folder contains the application's navigation setup using `go_router`. This setup ensures a structured and efficient way to handle navigation within the app.

## Files Overview

- **`router.dart`** - Configures `GoRouter`, defines app routes, and handles navigation.
- **`gorouter_observer.dart`** - Custom `NavigatorObserver` for tracking navigation events.
- **`route_const.dart`** - Centralized constants for route names to maintain consistency.

## Setup and Usage

### **1. Add `go_router` to `pubspec.yaml`**

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: ^10.1.0
```

### **2. Define the Router Configuration (`router.dart`)**

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_plan/core/screens/page_not_found.dart';
import 'package:person_plan/core/screens/splash_screen.dart';
import 'package:person_plan/features/authentication/presentation/pages/login_screen.dart';
import 'gorouter_observer.dart';
import 'route_const.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final NavigatorObserver defaultLifecycleObserver = NavigatorObserver();

final GoRouter routerConfig = GoRouter(
  initialLocation: RouteConst.splash,
  navigatorKey: navigatorKey,
  observers: [
    GoRouterObserver(),
    defaultLifecycleObserver,
  ],
  errorBuilder: (context, state) => const PageNotFound(),
  redirect: (context, state) => null, // Prevent infinite redirections
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
```

### **3. Custom Navigation Observer (`gorouter_observer.dart`)**

```dart
import 'package:flutter/material.dart';
import 'package:person_plan/core/helper/logger.dart';

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printLog('Pushed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printLog('Popped: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    printLog('Removed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    printLog('Replaced: ${newRoute?.settings.name}, with arguments: ${newRoute?.settings.arguments}');
  }
}
```

### **4. Define Route Constants (`route_const.dart`)**

```dart
class RouteConst {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
}
```

## **Using Navigation in the App**

### **1. Navigating to a Screen**

```dart
context.go(RouteConst.login);
```

### **2. Navigating with Query Parameters**

```dart
context.go('${RouteConst.home}?userId=123');
```

### **3. Pushing a Screen onto the Stack (Preserves Navigation History)**

```dart
context.push(RouteConst.signup);
```

### **4. Pushing with Extra Data**

```dart
context.push(RouteConst.home, extra: {'userId': 456});
```

### **5. Pushing Named Route**

```dart
context.pushNamed(RouteConst.signup);
```

### **6. Going Back**

```dart
context.pop();
```

### **7. Conditional Navigation with Redirects**

```dart
redirect: (context, state) {
  final isLoggedIn = checkUserLoginStatus();
  if (!isLoggedIn && state.subloc != RouteConst.login) {
    return RouteConst.login;
  }
  return null;
},
```

## Best Practices

- Use `RouteConst` for consistent route names.
- Utilize `GoRouterObserver` for debugging navigation.
- Use query parameters or extra data when passing arguments.
- Ensure all screens are properly registered in `router.dart`.

This setup ensures a scalable and maintainable navigation architecture for your app.
