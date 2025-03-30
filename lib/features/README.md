# Features Directory

The `features/` directory follows the **Feature-First Architecture**, where each feature has its own self-contained module, making the application more scalable and maintainable.

## Directory Structure

Each feature is organized as follows:

```
features/
│── authentication/
│   ├── data/
│   │   ├── datasources/
│   │   ├── models/
│   │   ├── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   ├── usecases/
│   ├── presentation/
│   │   ├── blocs/
│   │   ├── pages/
│   │   ├── widgets/
│── home/
│── profile/
│── settings/
```

### **Breakdown of Each Layer**

- **`data/`**: Handles data sources, models, and repositories.
  - `datasources/`: Manages API calls, local storage, and remote data fetching.
  - `models/`: Defines data models used across the feature.
  - `repositories/`: Implements data handling logic by interacting with data sources.
- **`domain/`**: Contains business logic.
  - `entities/`: Core domain objects representing the app's business logic.
  - `repositories/`: Defines contracts (abstract classes) that the data layer must implement.
  - `usecases/`: Encapsulates app logic to keep it reusable and testable.
- **`presentation/`**: Manages UI and state management.
  - `blocs/`: Handles state management using BLoC.
  - `pages/`: UI screens for the feature.
  - `widgets/`: Reusable UI components within the feature.

## Best Practices

- Keep feature folders self-contained to avoid unnecessary dependencies.
- Follow the **Separation of Concerns** principle to maintain clean architecture.
- Use dependency injection to manage services and repositories.
- Organize code in layers to promote better maintainability and scalability.

This structure ensures modular development, making it easy to scale and maintain the application.
