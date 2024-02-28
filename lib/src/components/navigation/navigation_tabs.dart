import 'package:flutter/material.dart';

import '../../extensions/context.dart';
import '../../storages/experience_storage.dart';
import '../../storages/projects_storage.dart';
import '../../storages/user_storage.dart';
import '../../screens/about_screen.dart';
import '../../screens/experience_screen.dart';
import '../../screens/projects_screen.dart';
import '../../screens/settings_screen.dart';

enum NavigationTab {
  about,
  experience,
  projects,
  settings;

  Icon get icon {
    return switch (this) {
      NavigationTab.about => Icon(Icons.person),
      NavigationTab.experience => Icon(Icons.business),
      NavigationTab.projects => Icon(Icons.work),
      NavigationTab.settings => Icon(Icons.settings)
    };
  }

  String getLabel(BuildContext context) {
    return switch (this) {
      NavigationTab.about => context.strings.tabAbout,
      NavigationTab.experience => context.strings.tabExperience,
      NavigationTab.projects => context.strings.tabProjects,
      NavigationTab.settings => context.strings.tabSettings
    };
  }

  Widget getScreen(BuildContext context) {
    return switch (this) {
      NavigationTab.about => AboutScreen(
          user: UserStorage(context).data,
        ),
      NavigationTab.experience => ExperienceScreen(
          experience: ExperienceStorage(context).data,
        ),
      NavigationTab.projects => ProjectsScreen(
          projects: ProjectsStorage(context).data,
        ),
      NavigationTab.settings => SettingsScreen()
    };
  }
}
