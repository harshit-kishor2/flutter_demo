import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:person_plan/app/all_global_bloc_providers.dart';
import 'package:person_plan/core/i18n/l10n.dart';
import 'package:person_plan/routes/app_router.dart';
import 'package:person_plan/core/theme/app_theme.dart';
import 'package:person_plan/core/theme/theme_cubit.dart';

part 'responsive_ui_wrapper.dart';

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
                I18n.delegate,
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
