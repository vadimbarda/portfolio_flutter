import '../../../generated/assets.gen.dart';

enum ProjectPlatform {
  android,
  ios,
  mac,
  windows;

  String get title {
    return switch (this) {
      ProjectPlatform.android => 'Android',
      ProjectPlatform.ios => 'iOS',
      ProjectPlatform.mac => 'Mac OS',
      ProjectPlatform.windows => 'Windows',
    };
  }

  AssetGenImage get logo {
    return switch (this) {
      ProjectPlatform.android => Assets.logos.android,
      ProjectPlatform.ios => Assets.logos.ios,
      ProjectPlatform.mac => Assets.logos.mac,
      ProjectPlatform.windows => Assets.logos.windows,
    };
  }
}
