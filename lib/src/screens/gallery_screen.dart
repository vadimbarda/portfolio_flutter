import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../generated/assets.gen.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({
    super.key,
    this.initialIndex = 0,
    required this.title,
    required this.galleryItems,
  }) : pageController = PageController(initialPage: initialIndex);

  final int initialIndex;
  final PageController pageController;
  final List<AssetGenImage> galleryItems;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: buildItem,
        itemCount: galleryItems.length,
        pageController: pageController,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  PhotoViewGalleryPageOptions buildItem(BuildContext context, int index) {
    final item = galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: item.provider(),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.keyName),
    );
  }
}
