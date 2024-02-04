import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

final defaultLanguage = Strings.delegate.supportedLocales.first.languageCode;
const defaultMode = ThemeMode.light;

class SettingsState extends Equatable {
  const SettingsState({
    required this.locale,
    required this.mode,
    required this.onboarded,
  });

  factory SettingsState.fromJson(Map<String, dynamic> jsonMap) {
    final mode = ThemeMode.values
        .firstWhereOrNull((mode) => mode.name == jsonMap['mode']);
    return SettingsState(
      locale: Locale(jsonMap['locale'] ?? defaultLanguage),
      mode: mode ?? defaultMode,
      onboarded: jsonMap['onboarded'] ?? false,
    );
  }

  factory SettingsState.fromState(
    SettingsState state, {
    Locale? locale,
    ThemeMode? mode,
    bool? onboarded,
  }) =>
      SettingsState(
        locale: locale ?? state.locale,
        mode: mode ?? state.mode,
        onboarded: onboarded ?? state.onboarded,
      );

  final Locale locale;
  final ThemeMode mode;
  final bool onboarded;

  String toString() {
    final map = <String, dynamic>{};
    map['locale'] = locale.languageCode;
    map['mode'] = mode.name;
    map['onboarded'] = onboarded;
    return json.encode(map);
  }

  @override
  List<Object?> get props => [locale, mode, onboarded];
}
