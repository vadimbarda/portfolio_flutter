import 'package:flutter/material.dart';

import '../../config/consts.dart';
import '../extensions/context.dart';
import '../models/project_model.dart';
import '../components/headers/tab_header.dart';
import '../components/projects/project_card.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key, required this.projects});

  final List<ProjectModel> projects;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Column(
          children: [
            TabHeader(title: context.strings.tabProjects),
            for (var project in projects) ProjectCard(project: project)
          ],
        ),
      ),
    );
  }
}
