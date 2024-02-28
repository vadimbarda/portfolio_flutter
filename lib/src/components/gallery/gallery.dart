import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../../screens/gallery_screen.dart';
import 'gallery_thumbnail.dart';

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
    required this.items,
    required this.title,
  });

  final List<AssetGenImage> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items
              .mapIndexed(
                (index, item) => GalleryThumbnail(
                  item: item,
                  onTap: () => openGallery(context, index),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void openGallery(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => GalleryScreen(
          title: title,
          galleryItems: items,
          initialIndex: index,
        ),
      ),
    );
  }
}
