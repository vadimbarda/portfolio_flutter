import 'dart:io';

import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../extensions/context.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: paddingLarge,
        top: Platform.isAndroid ? paddingLarge : 0,
      ),
      child: Text(
        title,
        style: context.textTheme.displaySmall,
      ),
    );
  }
}
