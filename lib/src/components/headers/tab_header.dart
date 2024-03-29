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
        top: paddingLarge,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: context.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
