import 'package:flutter/material.dart';

import 'typography.dart';

final class AppTheme {
  AppTheme(this.mode);

  final ThemeMode mode;
  final mainColor = Color.fromARGB(255, 50, 100, 160);

  Brightness get brightness {
    return mode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }

  ButtonStyle get buttonStyle {
    return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }

  ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: mainColor,
      ),
      useMaterial3: true,
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonStyle,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: buttonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonStyle,
      ),
    );
  }
}
