import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../extensions/context.dart';
import '../../models/user_model.dart';
import '../headers/tab_header.dart';
import 'avatar_banner.dart';
import 'list_section.dart';
import 'social_link.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabHeader(title: context.strings.tabAbout),
        AvatarBanner(
          avatar: user.avatar,
          name: user.name,
        ),
        for (var item in user.socialLinks) SocialLink(item: item),
        Padding(
          padding:
              const EdgeInsets.only(bottom: paddingMiddle, top: paddingLarge),
          child: Text(user.profile),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: paddingLarge),
          child: ListSection(
            title: context.strings.userSkills,
            list: user.skills,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: paddingLarge),
          child: ListSection(
            title: context.strings.userInterests,
            list: user.interests,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: paddingLarge),
          child: ListSection(
            title: context.strings.userHobbies,
            list: user.hobbies,
          ),
        )
      ],
    );
  }
}
