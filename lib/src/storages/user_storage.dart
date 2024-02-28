import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';
import '../extensions/context.dart';
import '../models/social_link_model.dart';
import '../models/user_model.dart';

class UserStorage {
  const UserStorage(this.context);

  final BuildContext context;

  UserModel get data {
    return UserModel(
      name: context.strings.userName,
      title: context.strings.userTitle,
      avatar: Assets.images.avatar,
      profile: context.strings.userProfile,
      skills: [
        'Dart',
        'Flutter',
        'OOP',
        'Bloc',
        'Firebase',
        'Azure',
        'Google Maps',
        'JS, HTML, CSS',
        'English Upper Intermediate',
      ],
      interests: [
        context.strings.userInterestsAITools,
        context.strings.userInterestsVideoEditing,
        context.strings.userInterestsInteriorDesign,
      ],
      hobbies: [
        context.strings.userHobbiesGuitar,
        context.strings.userHobbiesVocal,
        context.strings.userHobbiesSport,
      ],
      socialLinks: [
        SocialLinkModel(
          title: 'v.barda@online.ua',
          address: Uri.parse('mailto:v.barda@online.ua'),
          icon: Assets.logos.email,
        ),
        SocialLinkModel(
          title: 'LinkedIn',
          address:
              Uri.parse('https://www.linkedin.com/in/vadym-barda-26731b5/'),
          icon: Assets.logos.linkedin,
        ),
        SocialLinkModel(
          title: 'GitHub',
          address: Uri.parse('https://github.com/vadimbarda'),
          icon: Assets.logos.github,
        ),
        SocialLinkModel(
          title: 'CV',
          address: Uri.parse(
              'https://drive.google.com/file/d/17V5JUdNRwMRZzDcYA_7DlVr4Zl-JS8XN/view?usp=sharing'),
          icon: Assets.logos.cv,
        ),
      ],
    );
  }
}
