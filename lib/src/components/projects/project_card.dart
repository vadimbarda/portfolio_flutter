import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../../config/custom_colors.dart';
import '../../extensions/context.dart';
import '../../models/project_model.dart';
import '../../screens/project_screen.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final overlayColor = CustomColors.cardOverlay;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProjectScreen(project: project),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: project.banner.provider(),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsetsDirectional.all(paddingSmall),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    overlayColor.withOpacity(0.7),
                    overlayColor.withOpacity(0.5),
                    overlayColor.withOpacity(0),
                    overlayColor.withOpacity(0.7),
                    overlayColor.withOpacity(1),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (var platform in project.platforms)
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: platform.logo.provider(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        project.name,
                        style: context.textTheme.headlineLarge
                            ?.copyWith(color: CustomColors.cardOverlayText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
