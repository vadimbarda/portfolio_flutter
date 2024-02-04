import 'package:flutter/material.dart';

import '../../extensions/context.dart';
import '../about/about_tab.dart';
import '../experience/experience_tab.dart';
import '../projects/projects_tab.dart';
import '../settings/settings_tab.dart';

enum NavigationTab {
  about,
  experience,
  projects,
  settings;

  Widget get screen {
    return switch (this) {
      NavigationTab.about => AboutTab(),
      NavigationTab.experience => ExperienceTab(),
      NavigationTab.projects => ProjectsTab(),
      NavigationTab.settings => SettingsTab()
    };
  }

  NavigationDestination getDestination(BuildContext context) {
    return switch (this) {
      NavigationTab.about => NavigationDestination(
          icon: Icon(Icons.person),
          label: context.strings.tabAbout,
        ),
      NavigationTab.experience => NavigationDestination(
          icon: Icon(Icons.business),
          label: context.strings.tabExperience,
        ),
      NavigationTab.projects => NavigationDestination(
          icon: Icon(Icons.work),
          label: context.strings.tabProjects,
        ),
      NavigationTab.settings => NavigationDestination(
          icon: Icon(Icons.settings),
          label: context.strings.tabSettings,
        )
    };
  }
}
