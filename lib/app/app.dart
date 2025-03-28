import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:person_plan/app/all_global_bloc_providers.dart';
import 'package:person_plan/app/responsive_ui_wrapper.dart';
import 'package:person_plan/generated/l10n.dart';
import 'package:person_plan/routes/app_router.dart';
import 'package:person_plan/theme/app_theme.dart';
import 'package:person_plan/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AllGlobalBlocProviders(
      child: ResponsiveUiWrapper(
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const AppLocalizationDelegate().supportedLocales,
              routerConfig: routerConfig,
            );
          },
        ),
      ),
    );
  }
}
