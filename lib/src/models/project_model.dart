import '../../generated/assets.gen.dart';
import '../components/projects/project_platform.dart';

class ProjectModel {
  const ProjectModel({
    required this.name,
    required this.description,
    required this.banner,
    required this.platforms,
  });

  final String name;
  final String description;
  final AssetGenImage banner;
  final List<ProjectPlatform> platforms;
}
