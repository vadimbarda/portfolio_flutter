import 'package:flutter/material.dart';

import 'typography.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Color(0xFF3368AF),
  ),
  useMaterial3: true,
  textTheme: baseTextTheme,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color(0xFF3368AF),
  ),
  useMaterial3: true,
  textTheme: baseTextTheme,
);
