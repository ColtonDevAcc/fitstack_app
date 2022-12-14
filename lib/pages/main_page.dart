import 'package:FitStack/app/providers/cubit/main_view/main_view_cubit.dart';
import 'package:FitStack/pages/dashboard_page.dart';
import 'package:FitStack/pages/exercise_page.dart';
import 'package:FitStack/pages/nutrition_page.dart';
import 'package:FitStack/pages/relationship_page.dart';
import 'package:FitStack/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const DashboardPage(),
      const NutritionPage(),
      const ExercisePage(),
      const RelationshipPage(),
      const SettingsPage(),
    ];
    return BlocBuilder<MainViewCubit, MainViewState>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
        return PersistentTabView(
          context,
          controller: PersistentTabController(),
          screens: pages,
          items: [
            PersistentBottomNavBarItem(
              icon: const Icon(LineAwesome.home_solid),
              title: "Home",
              opacity: .8,
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(LineAwesome.utensils_solid),
              title: "Nutrition",
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(LineAwesome.dumbbell_solid),
              title: "Programs",
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(LineAwesome.users_solid),
              title: "Relations",
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(LineAwesome.ellipsis_h_solid),
              title: "More",
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.surface, // Default is Colors.white.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
        );
      },
    );
  }
}
