import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/social_link.dart';

class SocialLink extends StatelessWidget {
  const SocialLink({super.key, required this.item});

  final SocialItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: item.icon,
        ),
        TextButton(
          onPressed: () => openLink(item.address),
          child: Text(item.title),
        )
      ],
    );
  }

  void openLink(String address) {
    try {
      final uri = Uri.parse(item.address);
      launchUrl(uri);
    } catch (error) {
      print(error);
    }
  }
}
