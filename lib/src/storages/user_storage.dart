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
      avatar: Assets.images.avatar.provider(),
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
          address: 'mailto:v.barda@online.ua',
          icon: Assets.logos.email.image(),
        ),
        SocialLinkModel(
          title: 'LinkedIn',
          address: 'https://www.linkedin.com/in/vadym-barda-26731b5/',
          icon: Assets.logos.linkedin.image(),
        ),
        SocialLinkModel(
          title: 'GitHub',
          address: 'https://github.com/vadimbarda',
          icon: Assets.logos.github.image(),
        ),
        SocialLinkModel(
          title: 'CV',
          address:
              'https://drive.google.com/file/d/17V5JUdNRwMRZzDcYA_7DlVr4Zl-JS8XN/view?usp=sharing',
          icon: Assets.logos.cv.image(),
        ),
      ],
    );
  }
}
