import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/preference.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(Map<String, dynamic> jsonMap)
      : super(SettingsState.fromJson(jsonMap)) {
    Intl.defaultLocale = state.locale.languageCode;
    _setAppVersion();
  }

  void _save() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Preference.settings.key, state.toString());
  }

  void _setAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    emit(SettingsState.fromState(state, version: packageInfo.version));
  }

  void setLocale(Locale locale) {
    initializeDateFormatting(locale.languageCode);
    emit(SettingsState.fromState(state, locale: locale));
    _save();
  }

  void setMode(ThemeMode mode) {
    emit(SettingsState.fromState(state, mode: mode));
    _save();
  }

  void setOnboarded(bool onboarded) {
    emit(SettingsState.fromState(state, onboarded: onboarded));
    _save();
  }
}
