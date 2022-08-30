import 'package:FitStack/presentation/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:flutter/material.dart';

class UserGoalGraphsList extends StatelessWidget {
  const UserGoalGraphsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: [
          UserGoalStatisticsGraph(),
          UserGoalStatisticsGraph(),
          UserGoalStatisticsGraph(),
        ],
      ),
    );
  }
}
