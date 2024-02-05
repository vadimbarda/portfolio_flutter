import 'package:flutter/material.dart';

import 'social_link.dart';

class User {
  const User({
    required this.name,
    required this.title,
    required this.profile,
    required this.avatar,
    required this.socialLinks,
    required this.skills,
    required this.interests,
    required this.hobbies,
  });

  final String name;
  final String title;
  final String profile;
  final ImageProvider avatar;
  final List<SocialItem> socialLinks;
  final List<String> skills;
  final List<String> interests;
  final List<String> hobbies;
}
