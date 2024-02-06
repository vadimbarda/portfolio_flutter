import 'package:flutter/material.dart';

import '../../extensions/context.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    super.key,
    required this.title,
    required this.list,
  });

  final String title;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: context.textTheme.headlineSmall,
        ),
        for (var item in list) Text('• $item')
      ],
    );
  }
}
