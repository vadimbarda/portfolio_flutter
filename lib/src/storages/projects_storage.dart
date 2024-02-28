import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';
import '../components/projects/project_platform.dart';
import '../extensions/context.dart';
import '../models/feature_model.dart';
import '../models/project_model.dart';
import '../models/social_link_model.dart';

class ProjectsStorage {
  const ProjectsStorage(this.context);

  final BuildContext context;

  List<ProjectModel> get data {
    return [
      ProjectModel(
        name: 'TGL',
        description: context.strings.tglDescription,
        conclusion: context.strings.tglConclusion,
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
        description: context.strings.mediaCasaDescription,
        conclusion: context.strings.mediaCasaConclusion,
        banner: Assets.images.mediacasa.banner,
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
        screenshots: [
          Assets.images.mediacasa.screen1,
          Assets.images.mediacasa.screen2,
          Assets.images.mediacasa.screen3,
          Assets.images.mediacasa.screen4,
          Assets.images.mediacasa.screen5,
          Assets.images.mediacasa.screen6,
        ],
        features: [
          FeatureModel(
            name: context.strings.mediaCasaFeatureSourceSelectionName,
            description:
                context.strings.mediaCasaFeatureSourceSelectionDescription,
          ),
          FeatureModel(
            name: context.strings.mediaCasaFeatureAlbumCreationName,
            description:
                context.strings.mediaCasaFeatureAlbumCreationDescription,
          ),
          FeatureModel(
            name: context.strings.mediaCasaFeatureNameSuggestionName,
            description:
                context.strings.mediaCasaFeatureNameSuggestionDescription,
          ),
          FeatureModel(
            name: context.strings.mediaCasaFeatureSimilarPhotosName,
            description:
                context.strings.mediaCasaFeatureSimilarPhotosDescription,
          ),
          FeatureModel(
            name: context.strings.mediaCasaFeatureTimestampCorrectionName,
            description:
                context.strings.mediaCasaFeatureTimestampCorrectionDescription,
          ),
          FeatureModel(
            name: context.strings.mediaCasaFeatureOrganizedStructureName,
            description:
                context.strings.mediaCasaFeatureOrganizedStructureDescription,
          ),
          FeatureModel(
            name: context.strings.mediaCasaFeatureEditingCapabilityName,
            description:
                context.strings.mediaCasaFeatureEditingCapabilityDescription,
          ),
          FeatureModel(
            name: context.strings.mediaCasaFeatureSubscriptionModelName,
            description:
                context.strings.mediaCasaFeatureSubscriptionModelDescription,
          ),
        ],
      ),
      ProjectModel(
        name: context.strings.workPivbank,
        description: context.strings.pivbankDescription,
        conclusion: context.strings.pivbankConclusion,
        banner: Assets.images.pivbank.banner,
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
        screenshots: [
          Assets.images.pivbank.screen1,
          Assets.images.pivbank.screen2,
          Assets.images.pivbank.screen3,
          Assets.images.pivbank.screen4,
          Assets.images.pivbank.screen5,
        ],
        features: [
          FeatureModel(
            name: context.strings.pivbankFeatureAvailabilityName,
            description: context.strings.pivbankFeatureAvailabilityDescription,
          ),
          FeatureModel(
            name: context.strings.pivbankFeatureOrderingName,
            description: context.strings.pivbankFeatureOrderingDescription,
          ),
          FeatureModel(
            name: context.strings.pivbankFeatureLoyaltyName,
            description: context.strings.pivbankFeatureLoyaltyDescription,
          ),
          FeatureModel(
            name: context.strings.pivbankFeatureGamificationName,
            description: context.strings.pivbankFeatureGamificationDescription,
          ),
          FeatureModel(
            name: context.strings.pivbankFeatureLevelsName,
            description: context.strings.pivbankFeatureLevelsDescription,
          ),
          FeatureModel(
            name: context.strings.pivbankFeatureNotificationsName,
            description: context.strings.pivbankFeatureNotificationsDescription,
          ),
          FeatureModel(
            name: context.strings.pivbankFeatureTrackingName,
            description: context.strings.pivbankFeatureTrackingDescription,
          ),
        ],
      ),
    ];
  }
}
