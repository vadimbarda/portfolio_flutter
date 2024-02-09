import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';
import '../components/projects/project_platform.dart';
import '../extensions/context.dart';
import '../models/project_model.dart';
import '../models/social_link_model.dart';

class ProjectsStorage {
  const ProjectsStorage(this.context);

  final BuildContext context;

  List<ProjectModel> get data {
    return [
      ProjectModel(
        name: 'TGL',
        description: 'description',
        banner: Assets.images.tgl,
        platforms: [ProjectPlatform.ios, ProjectPlatform.android],
        tags: [
          'Adobe Analytics',
          'Authentication',
          'Azure B2C',
          'Azure',
          'Bloc',
          'Braze',
          'Brightcove player',
          'Firebase',
          'Golf',
          'Google Ads',
          'GraphQL',
          'HTML',
          'OneTrust',
          'Push Notifications',
          'WebView',
        ],
      ),
      ProjectModel(
        name: 'MediaCasa',
        description: 'description',
        banner: Assets.images.mediaCasa,
        video: Uri.parse('https://pivbank.mk.ua/media_casa/1.mp4'),
        platforms: [ProjectPlatform.windows, ProjectPlatform.mac],
        tags: [
          'Authentication',
          'Bloc',
          'Cloud Functions',
          'Codemagic',
          'EXIF',
          'FFMpeg',
          'Firebase',
          'Firestore',
          'FluentUI',
          'GPS',
          'Metadata',
          'Photo Comparison Algorithm',
          'Photo',
          'Stripe',
          'Subscription',
          'Video',
          'WebView',
        ],
        downloadLinks: [
          SocialLinkModel(
            title: 'Microsoft Store',
            address:
                Uri.parse('https://www.microsoft.com/store/apps/9PP75P6J45GJ'),
            icon: Assets.logos.microsoftStore,
          ),
          SocialLinkModel(
            title: 'Mac App Store',
            address: Uri.parse(
                'https://apps.apple.com/us/app/mediacasa-ai/id6445956069'),
            icon: Assets.logos.appStore,
          )
        ],
      ),
      ProjectModel(
        name: context.strings.workPivbank,
        description: 'description',
        banner: Assets.images.pivbank,
        platforms: [ProjectPlatform.ios, ProjectPlatform.android],
        tags: [
          'CMS Integration',
          'Codemagic',
          'Firebase',
          'Google Maps',
          'Location Picker',
          'Phone Authentication',
          'Push Notifications',
        ],
      ),
    ];
  }
}
