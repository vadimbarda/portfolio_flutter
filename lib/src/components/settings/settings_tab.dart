import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/consts.dart';
import '../../blocks/settings/settings_cubit.dart';
import '../../extensions/context.dart';
import 'language_picker.dart';
import 'theme_switcher.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: paddingLarge),
          child: Text(
            context.strings.tabSettings,
            style: context.textTheme.displaySmall,
          ),
        ),
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
        )
      ],
    );
  }
}
