import 'package:flutter/material.dart';

import '../../config/consts.dart';
import '../../generated/assets.gen.dart';
import '../components/external_link/external_link.dart';
import '../components/gallery/gallery.dart';
import '../components/projects/project_banner.dart';
import '../extensions/context.dart';
import '../models/project_model.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final screenshots = project.screenshots;
    return Scaffold(
      appBar: AppBar(title: Text(project.name)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectBanner(project: project),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: pagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: paddingLarge),
                      child: buildTags(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: paddingLarge),
                      child: buildPlatformsInfo(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: paddingLarge),
                      child: buildDownloads(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: paddingLarge),
                      child: buildDesscription(context),
                    ),
                    if (screenshots != null)
                      Padding(
                        padding: EdgeInsets.only(top: paddingLarge),
                        child: buildGallery(screenshots),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTags(BuildContext context) {
    return Wrap(
      spacing: paddingSmall,
      children: [
        for (var tag in project.tags)
          Chip(
            padding: EdgeInsets.zero,
            backgroundColor: context.colors.primary,
            label: Text(
              tag,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.colors.onPrimary),
            ),
          ),
      ],
    );
  }

  Widget buildPlatformsInfo(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        context.strings.projectPlatforms,
        style: context.textTheme.titleMedium,
      ),
      Text(project.platforms.map((platform) => platform.title).join(', ')),
    ]);
  }

  Widget buildDesscription(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        context.strings.projectDescription,
        style: context.textTheme.titleMedium,
      ),
      Text(project.description),
    ]);
  }

  Widget buildDownloads(BuildContext context) {
    final links = project.downloadLinks ?? [];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        context.strings.projectStorages,
        style: context.textTheme.titleMedium,
      ),
      if (links.isEmpty) Text(context.strings.projectNotPublished),
      for (var link in links) ExternalLink(item: link),
    ]);
  }

  Widget buildGallery(List<AssetGenImage> images) {
    return Gallery(
      items: images,
      title: project.name,
    );
  }
}
