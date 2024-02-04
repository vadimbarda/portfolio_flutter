import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../../blocks/settings/settings_cubit.dart';

const Map<String, String> languageMap = {
  'en': 'English',
  'uk': 'Українська',
};

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final locales = Strings.delegate.supportedLocales;
    return DropdownButton<Locale>(
      value: context.watch<SettingsCubit>().state.locale,
      items: locales
          .map(
            (locale) => DropdownMenuItem(
              value: locale,
              child: Text(languageMap[locale.languageCode] ?? ''),
            ),
          )
          .toList(),
      onChanged: ((locale) {
        if (locale != null) {
          context.read<SettingsCubit>().setLocale(locale);
        }
      }),
    );
  }
}
