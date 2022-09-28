import 'package:FitStack/app/providers/cubit/cubit/main_view_cubit.dart';
import 'package:FitStack/presentation/dashboard/presentation/dashboard_view.dart';
import 'package:FitStack/presentation/nutrition/presentation/nutrition_view.dart';
import 'package:FitStack/presentation/relationship/presentation/relationship_view.dart';
import 'package:FitStack/presentation/settings/settings_view.dart';
import 'package:FitStack/presentation/workout/presentation/workout_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class Main_View extends StatelessWidget {
  const Main_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      DashboardView(),
      NutritionView(),
      WorkoutView(),
      RelationshipView(),
      SettingsView(),
    ];
    return BlocBuilder<MainViewCubit, MainViewState>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
        return Scaffold(
          body: pages[state.pageIndex],
          extendBody: true,
          extendBodyBehindAppBar: true,
          primary: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          bottomNavigationBar: DotNavigationBar(
            enablePaddingAnimation: true,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600.withOpacity(.3),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
            enableFloatingNavBar: true,
            currentIndex: state.pageIndex,
            dotIndicatorColor: Colors.transparent,
            onTap: (p0) => BlocProvider.of<MainViewCubit>(context).onPageChanged(pageIndex: p0),
            backgroundColor: Theme.of(context).colorScheme.surface,
            items: [
              DotNavigationBarItem(
                unselectedColor: Theme.of(context).iconTheme.color,
                selectedColor: Theme.of(context).colorScheme.primary,
                icon: Icon(LineIcons.home),
              ),
              DotNavigationBarItem(
                unselectedColor: Theme.of(context).iconTheme.color,
                selectedColor: Theme.of(context).colorScheme.primary,
                icon: Icon(LineIcons.utensils),
              ),
              DotNavigationBarItem(
                unselectedColor: Theme.of(context).iconTheme.color,
                selectedColor: Theme.of(context).colorScheme.primary,
                icon: Icon(LineIcons.dumbbell),
              ),
              DotNavigationBarItem(
                unselectedColor: Theme.of(context).iconTheme.color,
                selectedColor: Theme.of(context).colorScheme.primary,
                icon: Icon(LineIcons.userFriends),
              ),
              DotNavigationBarItem(
                unselectedColor: Theme.of(context).iconTheme.color,
                selectedColor: Theme.of(context).colorScheme.primary,
                icon: Icon(LineIcons.horizontalEllipsis),
              )
            ],
          ),
        );
      },
    );
  }
}
