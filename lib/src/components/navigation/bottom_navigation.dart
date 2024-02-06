import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/consts.dart';
import '../../blocks/navigation/navigation_cubit.dart';
import 'navigation_tabs.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.tabs,
    required this.currentIndex,
  });

  final List<NavigationTab> tabs;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? buildIOSBar(context) : buildAndroidBar(context);
  }

  Widget buildAndroidBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      destinations: tabs
          .map<NavigationDestination>(
            (tab) => NavigationDestination(
              icon: tab.icon,
              label: tab.getLabel(context),
            ),
          )
          .toList(),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      onDestinationSelected: (index) => onTabSelect(context, index),
    );
  }

  Widget buildIOSBar(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: currentIndex,
      onTap: (index) => onTabSelect(context, index),
      items: tabs
          .map<BottomNavigationBarItem>(
            (tab) => BottomNavigationBarItem(
              icon: tab.icon,
              label: tab.getLabel(context),
            ),
          )
          .toList(),
    );
  }

  void onTabSelect(BuildContext context, int index) {
    context.read<NavigationCubit>().setActiveTab(tabs.elementAtOrNull(index));
  }
}
