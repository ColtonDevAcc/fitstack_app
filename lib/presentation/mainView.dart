import 'package:FitStack/app/providers/cubit/main_view/main_view_cubit.dart';
import 'package:FitStack/presentation/dashboard/presentation/dashboard_view.dart';
import 'package:FitStack/presentation/exercise/exercise_screen.dart';
import 'package:FitStack/presentation/nutrition/presentation/nutrition_view.dart';
import 'package:FitStack/presentation/relationship/presentation/relationship_view.dart';
import 'package:FitStack/presentation/settings/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Main_View extends StatelessWidget {
  const Main_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DashboardView(),
      NutritionView(),
      ExerciseScreen(),
      RelationshipView(),
      SettingsView(),
    ];
    return BlocBuilder<MainViewCubit, MainViewState>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
        return PersistentTabView(
          context,
          controller: PersistentTabController(initialIndex: 0),
          screens: pages,
          items: [
            PersistentBottomNavBarItem(
              icon: Icon(LineIcons.home),
              title: ("Home"),
              opacity: .8,
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(LineIcons.utensils),
              title: ("Nutrition"),
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(LineIcons.dumbbell),
              title: ("Programs"),
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(LineIcons.users),
              title: ("Relations"),
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
              icon: Icon(LineIcons.horizontalEllipsis),
              title: ("More"),
              activeColorPrimary: Theme.of(context).colorScheme.primary,
              activeColorSecondary: Theme.of(context).colorScheme.surface,
              inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
          ],
          confineInSafeArea: true,
          backgroundColor: Theme.of(context).colorScheme.surface, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style10, // Choose the nav bar style with this property.
        );
      },
    );
  }
}
