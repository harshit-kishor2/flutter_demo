import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/di/injection_container.dart';
import 'package:person_plan/theme/theme_cubit.dart';

class AllGlobalBlocProviders extends StatelessWidget {
  final Widget child;

  /// A widget that provides all the global blocs in the app.
  ///
  /// [child] - The child widget of this widget.
  ///
  const AllGlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // All global blocs
        BlocProvider<ThemeCubit>(create: (_) => serviceLocator<ThemeCubit>()),
      ],
      child: child,
    );
  }
}
