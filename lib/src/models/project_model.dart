import '../../generated/assets.gen.dart';
import '../components/projects/project_platform.dart';
import 'social_link_model.dart';

class ProjectModel {
  const ProjectModel({
    required this.name,
    required this.description,
    required this.banner,
    required this.platforms,
    required this.tags,
    this.video,
    this.downloadLinks,
  });

  final String name;
  final String description;
  final AssetGenImage banner;
  final List<ProjectPlatform> platforms;
  final List<String> tags;
  final Uri? video;
  final List<SocialLinkModel>? downloadLinks;
}
