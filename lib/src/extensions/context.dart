import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

extension StringsExtension on BuildContext {
  Strings get strings => Strings.of(this);
}

extension TypographyExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension ColorSchemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
