import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/consts.dart';
import '../../generated/assets.gen.dart';
import '../blocks/bloc_factory/bloc_factory.dart';
import '../blocks/navigation/navigation_cubit.dart';
import '../components/navigation/navigation_tabs.dart';

const navTabs = [
  NavigationTab.projects,
  NavigationTab.experience,
  NavigationTab.about,
  NavigationTab.settings,
];

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key, required this.decorOffset});

  final double decorOffset;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocFactory<NavigationCubit, NavigationTab>(
      create: (context) => NavigationCubit(navTabs.first),
      builder: (context, currentTab) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: -decorOffset,
              child: Opacity(
                opacity: 0.3,
                child: Assets.images.decor.image(
                  height: screenHeight,
                  alignment: Alignment.topLeft,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned.fill(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: pagePadding),
                  child: SingleChildScrollView(
                    child: currentTab.screen,
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: navTabs.indexOf(currentTab),
          destinations:
              navTabs.map((tab) => tab.getDestination(context)).toList(),
          onDestinationSelected: (index) => context
              .read<NavigationCubit>()
              .setActiveTab(navTabs.elementAtOrNull(index)),
        ),
      ),
    );
  }
}
