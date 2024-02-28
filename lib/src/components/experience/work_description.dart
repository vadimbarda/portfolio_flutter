import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/work_model.dart';

class WorkDescription extends StatelessWidget {
  const WorkDescription({
    super.key,
    required this.work,
  });

  final WorkModel work;

  @override
  Widget build(BuildContext context) {
    final links = work.links ?? [];
    final description = work.description;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) Text(description),
        for (var link in links)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                  child: Text(
                    link.toString(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  onPressed: () => openLink(link),
                ),
              )
            ],
          )
      ],
    );
  }

  void openLink(Uri address) {
    try {
      launchUrl(address);
    } catch (error) {
      print(error);
    }
  }
}
