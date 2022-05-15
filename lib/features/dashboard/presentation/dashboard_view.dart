import 'package:fitstackapp/widgets/molecules/statistics_dashboard.dart';
import 'package:flutter/material.dart';

import '../../../widgets/molecules/statistics_dashboard.dart';

class DashBoard_View extends StatelessWidget {
  const DashBoard_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HOW YOUR DAY LOOK?", style: Theme.of(context).textTheme.headline3),
                Text("Stats"),
                Statistics_Dashboard(),
                Text("Daily Workouts"),
                Container(
                  height: 200,
                  width: 100,
                  color: Colors.purple[200],
                ),
                Text("Progress"),
                Container(
                  height: 200,
                  width: 100,
                  color: Colors.grey[300],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
