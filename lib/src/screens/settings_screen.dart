import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/consts.dart';
import '../blocks/settings/settings_cubit.dart';
import '../extensions/context.dart';
import '../components/headers/tab_header.dart';
import '../components/settings/language_picker.dart';
import '../components/settings/theme_switcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: pagePadding),
      child: Column(
        children: [
          TabHeader(title: context.strings.tabSettings),
          Padding(
            padding: const EdgeInsets.only(bottom: paddingSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.strings.settingsLanguage,
                  style: context.textTheme.bodyLarge,
                ),
                LanguagePicker()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: paddingSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.strings.settingsThemeMode,
                  style: context.textTheme.bodyLarge,
                ),
                ThemeSwitcher()
              ],
            ),
          ),
          FilledButton(
            child: Text(context.strings.buttonShowWelcomeScreen.toUpperCase()),
            onPressed: () => context.read<SettingsCubit>().setOnboarded(false),
          ),
        ],
      ),
    );
  }
}
