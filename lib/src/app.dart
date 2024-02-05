import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../config/app_theme.dart';
import '../generated/l10n.dart';
import 'blocks/app_loader.dart/app_loader_cubit.dart';
import 'blocks/app_loader.dart/app_loader_state.dart';
import 'blocks/bloc_factory/bloc_factory.dart';
import 'blocks/settings/settings_cubit.dart';
import 'blocks/settings/settings_state.dart';
import 'screens/landing_screen.dart';
import 'screens/welcome_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final decorOffset = MediaQuery.of(context).size.width;
    return BlocFactory<AppLoaderCubit, AppLoaderState>(
      create: (context) => AppLoaderCubit(),
      builder: (context, appState) => switch (appState) {
        AppLoaderStateLoading() => MaterialApp(
            home: SizedBox.shrink(),
          ),
        AppLoaderStateReady() => BlocFactory<SettingsCubit, SettingsState>(
            create: (context) => SettingsCubit(appState.settings),
            builder: (context, settings) => MaterialApp(
              title: 'barda',
              localizationsDelegates: const [
                Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: Strings.delegate.supportedLocales,
              locale: settings.locale,
              theme: AppTheme(settings.mode).theme,
              themeMode: settings.mode,
              debugShowCheckedModeBanner: false,
              home: settings.onboarded
                  ? LandingScreen(decorOffset: decorOffset)
                  : WelcomeScreen(decorOffset: decorOffset),
            ),
          ),
      },
    );
  }
}
