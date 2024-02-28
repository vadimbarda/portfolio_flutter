import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/consts.dart';
import '../../models/social_link_model.dart';

class ExternalLink extends StatelessWidget {
  const ExternalLink({super.key, required this.item});

  final SocialLinkModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: paddingSmall),
          child: SizedBox(
            height: 25,
            width: 25,
            child: item.icon.image(),
          ),
        ),
        TextButton(
          onPressed: () => openLink(item.address),
          child: Text(item.title),
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
