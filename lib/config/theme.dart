import 'package:flutter/material.dart';

import 'typography.dart';

const _mainColor = Color(0xFF3368AF);
const _buttonPadding = EdgeInsets.symmetric(horizontal: 30);
const _buttonBorder = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
);
final _buttonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(_buttonPadding),
  shape: MaterialStateProperty.all<OutlinedBorder>(_buttonBorder),
  elevation: MaterialStateProperty.all<double>(3),
);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: _mainColor,
  ),
  useMaterial3: true,
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _buttonStyle,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: _buttonStyle,
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: _mainColor,
  ),
  useMaterial3: true,
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _buttonStyle,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: _buttonStyle,
  ),
);
