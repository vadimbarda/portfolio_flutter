import 'package:flutter/material.dart';

import '../../config/consts.dart';
import '../extensions/context.dart';
import '../models/user_model.dart';
import '../components/headers/tab_header.dart';
import '../components/about/avatar_banner.dart';
import '../components/about/list_section.dart';
import '../components/external_link/external_link.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabHeader(title: context.strings.tabAbout),
          AvatarBanner(
            avatar: user.avatar,
            name: user.name,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in user.socialLinks) ExternalLink(item: item),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: paddingMiddle,
                    top: paddingLarge,
                  ),
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
            ),
          ),
        ],
      ),
    );
  }
}
