import 'package:flutter/material.dart';

import '../../config/consts.dart';
import '../../generated/assets.gen.dart';
import '../blocks/bloc_factory/bloc_factory.dart';
import '../blocks/navigation/navigation_cubit.dart';
import '../components/navigation/bottom_navigation.dart';
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
                  child: buildAnimatedTransition(context, currentTab),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          tabs: navTabs,
          currentIndex: navTabs.indexOf(currentTab),
        ),
      ),
    );
  }

  Widget buildAnimatedTransition(BuildContext context, NavigationTab tab) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 0.1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
      ),
      child: Align(
        key: ValueKey<NavigationTab>(tab),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: tab.getScreen(context),
        ),
      ),
    );
  }
}
