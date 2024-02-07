import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../extensions/context.dart';
import '../../models/work_model.dart';
import '../headers/tab_header.dart';
import 'work.dart';

class ExperienceTab extends StatelessWidget {
  const ExperienceTab({
    super.key,
    required this.experience,
  });

  final List<WorkModel> experience;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: pagePadding, left: 10),
        child: Column(
          children: [
            TabHeader(title: context.strings.tabExperience),
            for (var work in experience) Work(work: work),
          ],
        ),
      ),
    );
  }
}
