import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../extensions/context.dart';
import '../../models/feature_model.dart';
import '../../models/project_model.dart';

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final features = project.features;
    return Column(
      children: [
        Text(project.description),
        if (features != null)
          Padding(
            padding: const EdgeInsets.only(top: paddingSmall),
            child: Column(
              children: [
                for (var feature in features) buildFeature(context, feature),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: paddingSmall),
          child: Text(project.conclusion),
        ),
      ],
    );
  }

  Widget buildFeature(BuildContext context, FeatureModel feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• '),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${feature.name}: ',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: feature.description,
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
