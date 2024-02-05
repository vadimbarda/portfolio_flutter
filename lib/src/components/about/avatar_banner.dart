import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../../generated/assets.gen.dart';

class AvatarBanner extends StatelessWidget {
  const AvatarBanner({
    super.key,
    required this.avatar,
    required this.name,
  });

  final ImageProvider avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.profileBanner.provider(),
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: avatar,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(name),
          ],
        ),
      ],
    );
  }
}
