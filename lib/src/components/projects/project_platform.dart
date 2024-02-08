import '../../../generated/assets.gen.dart';

enum ProjectPlatform {
  android,
  ios,
  mac,
  windows;

  AssetGenImage get logo {
    return switch (this) {
      ProjectPlatform.android => Assets.logos.android,
      ProjectPlatform.ios => Assets.logos.ios,
      ProjectPlatform.mac => Assets.logos.mac,
      ProjectPlatform.windows => Assets.logos.windows,
    };
  }
}
