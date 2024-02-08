import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';
import '../components/projects/project_platform.dart';
import '../extensions/context.dart';
import '../models/project_model.dart';

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
      ),
      ProjectModel(
        name: 'MediaCasa',
        description: 'description',
        banner: Assets.images.mediaCasa,
        platforms: [ProjectPlatform.windows, ProjectPlatform.mac],
      ),
      ProjectModel(
        name: context.strings.workPivbank,
        description: 'description',
        banner: Assets.images.pivbank,
        platforms: [ProjectPlatform.ios, ProjectPlatform.android],
      ),
    ];
  }
}
