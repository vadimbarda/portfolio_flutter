import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/preference.dart';
import 'app_loader_state.dart';

final class AppLoaderCubit extends Cubit<AppLoaderState> {
  AppLoaderCubit() : super(AppLoaderStateLoading()) {
    _load();
  }

  void _load() async {
    final settings = await _getSettings();
    FlutterNativeSplash.remove();
    emit(AppLoaderStateReady(settings));
  }

  Future<Map<String, dynamic>> _getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    String? settings = prefs.getString(Preference.settings.key);
    final jsonMap =
        settings == null ? <String, dynamic>{} : json.decode(settings);
    return jsonMap;
  }
}
