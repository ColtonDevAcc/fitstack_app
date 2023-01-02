import 'package:FitStack/app/providers/cubit/main_view/main_view_cubit.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  final Widget child;
  final dynamic Function(int) onTap;
  const MainPage({Key? key, required this.child, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.background;
    final unselectedColor = Theme.of(context).colorScheme.surface;
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: BlocBuilder<MainViewCubit, MainViewState>(
        buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
        builder: (context, state) {
          return CustomNavigationBar(
            onTap: (p0) {
              onTap(p0);
              context.read<MainViewCubit>().onPageChanged(pageIndex: p0);
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            currentIndex: state.pageIndex,
            unSelectedColor: unselectedColor,
            selectedColor: selectedColor,
            isFloating: true,
            borderRadius: const Radius.circular(20),
            items: [
              CustomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.house),
                selectedIcon: const Icon(FontAwesomeIcons.solidHouse),
              ),
              CustomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.utensils),
                selectedIcon: const Icon(FontAwesomeIcons.solidUtensils),
              ),
              CustomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.dumbbell),
                selectedIcon: const Icon(FontAwesomeIcons.solidDumbbell),
              ),
              CustomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.user),
                selectedIcon: const Icon(FontAwesomeIcons.solidUser),
              ),
              CustomNavigationBarItem(
                icon: const Icon(FontAwesomeIcons.ellipsis),
                selectedIcon: const Icon(FontAwesomeIcons.solidEllipsis),
              ),
            ],
          );
        },
      ),
    );
  }
}
