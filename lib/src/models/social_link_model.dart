import '../../generated/assets.gen.dart';

class SocialLinkModel {
  const SocialLinkModel({
    required this.title,
    required this.address,
    required this.icon,
  });

  final String title;
  final Uri address;
  final AssetGenImage icon;
}
