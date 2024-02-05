import 'package:flutter/material.dart';

class SocialItem {
  const SocialItem({
    required this.title,
    required this.address,
    required this.icon,
  });

  final String title;
  final String address;
  final Image icon;
}
