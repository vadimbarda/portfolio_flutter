import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../../generated/assets.gen.dart';

class AvatarBanner extends StatelessWidget {
  const AvatarBanner({
    super.key,
    required this.avatar,
    required this.name,
  });

  final AssetGenImage avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: pagePadding),
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Assets.images.profileBanner.provider(),
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
                opacity: 0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: avatar.provider(),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: pagePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(name),
            ],
          ),
        ),
      ],
    );
  }
}
