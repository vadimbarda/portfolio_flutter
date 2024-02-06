import 'package:flutter/material.dart';

import '../../extensions/context.dart';
import '../../storages/user_storage.dart';
import '../about/about_tab.dart';
import '../experience/experience_tab.dart';
import '../projects/projects_tab.dart';
import '../settings/settings_tab.dart';

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
      NavigationTab.about => AboutTab(
          user: UserStorage(context).data,
        ),
      NavigationTab.experience => ExperienceTab(),
      NavigationTab.projects => ProjectsTab(),
      NavigationTab.settings => SettingsTab()
    };
  }
}
