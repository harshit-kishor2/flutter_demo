# Dependency Injection (DI)

The `di/` directory contains the dependency injection setup for the application, using `GetIt` for service location. This ensures a centralized way to manage dependencies and improve modularity.

## Files

- **`dependency_injection.dart`**: Contains the service locator instance and initialization logic.

## Service Locator Setup

### **Initializing Service Locator**

In `dependency_injection.dart`, we use `GetIt` to register dependencies that can be accessed anywhere in the app.

```dart
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // Register services here

  // Wait for all async dependencies to be ready
  await serviceLocator.allReady();
}
```

### **Registering Dependencies**

To register a dependency, use `registerSingleton`, `registerLazySingleton`, or `registerFactory`.

#### **Registering Services & Repositories**

```dart
serviceLocator.registerLazySingleton<ApiService>(() => ApiService());
serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepository(serviceLocator<ApiService>()));
```

#### **Registering BLoC Classes**

```dart
serviceLocator.registerFactory<AuthBloc>(() => AuthBloc(serviceLocator<AuthRepository>()));
```

### **Using Dependencies in the App**

Once registered, you can access dependencies anywhere in the app:

```dart
final authBloc = serviceLocator<AuthBloc>();
```

or inside a widget:

```dart
@override
Widget build(BuildContext context) {
  return BlocProvider(
    create: (context) => serviceLocator<AuthBloc>(),
    child: LoginScreen(),
  );
}
```

## Best Practices

- Use `registerLazySingleton` for services that should persist throughout the app lifecycle.
- Use `registerFactory` for dependencies that need a new instance every time they are requested.
- Ensure dependencies are registered in `initializeServiceLocator()` before using them in the app.
- Use `await serviceLocator.allReady();` to make sure all async dependencies are ready before using them.

By structuring dependency injection in this way, we promote scalability and maintainability within the **Feature-First Architecture** approach.
