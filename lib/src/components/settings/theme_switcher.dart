import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocks/settings/settings_cubit.dart';
import '../../extensions/context.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.watch<SettingsCubit>();
    return Row(
      children: [
        const Icon(Icons.dark_mode),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Switch.adaptive(
            activeColor: context.colors.primary,
            value: settingsCubit.state.mode == ThemeMode.light,
            onChanged: (v) {
              if (v) {
                settingsCubit.setMode(ThemeMode.light);
              } else {
                settingsCubit.setMode(ThemeMode.dark);
              }
            },
          ),
        ),
        const Icon(Icons.light_mode),
      ],
    );
  }
}
