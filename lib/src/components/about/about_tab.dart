import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../extensions/context.dart';
import '../../models/user.dart';
import '../headers/tab_header.dart';
import 'avatar_banner.dart';
import 'social_link.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabHeader(title: context.strings.tabAbout),
        Padding(
          padding: const EdgeInsets.only(bottom: paddingMiddle),
          child: Text(user.profile),
        ),
        AvatarBanner(
          avatar: user.avatar,
          name: user.name,
        ),
        for (var item in user.socialLinks) SocialLink(item: item)
      ],
    );
  }
}
