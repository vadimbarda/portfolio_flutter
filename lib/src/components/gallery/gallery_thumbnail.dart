import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';

class GalleryThumbnail extends StatelessWidget {
  const GalleryThumbnail({
    Key? key,
    required this.item,
    required this.onTap,
  });

  final AssetGenImage item;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: item.keyName,
          child: item.image(
            height: 100.0,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
