import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Main_View extends StatefulWidget {
  const Main_View({Key? key}) : super(key: key);

  @override
  State<Main_View> createState() => _Main_ViewState();
}

class _Main_ViewState extends State<Main_View> {
  int viewIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> mainViews = [
      DashBoard_View(),
      DashBoard_View(),
      DashBoard_View(),
      DashBoard_View(),
      DashBoard_View(),
    ];

    return Scaffold(
      body: mainViews[viewIndex],
      bottomNavigationBar: DotNavigationBar(
        currentIndex: viewIndex,
        dotIndicatorColor: Colors.transparent,
        onTap: (_index) {
          setState(() {
            viewIndex = _index;
          });
          print(viewIndex);
        },
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
  }
}

class DashBoard_View extends StatelessWidget {
  const DashBoard_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('DashBoard'),
    );
  }
}
