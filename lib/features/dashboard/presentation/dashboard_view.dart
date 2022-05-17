import 'package:fitstackapp/widgets/atoms/workout_card.dart';
import 'package:fitstackapp/widgets/molecules/statistics_dashboard.dart';
import 'package:flutter/material.dart';

import '../../../widgets/molecules/statistics_dashboard.dart';

class DashBoard_View extends StatefulWidget {
  DashBoard_View({Key? key}) : super(key: key);

  @override
  State<DashBoard_View> createState() => _DashBoard_ViewState();
}

class _DashBoard_ViewState extends State<DashBoard_View> {
  final ScrollController listController =
      ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HOW YOUR DAY LOOKS?",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Stats",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Statistics_Dashboard(),
                  Text(
                    "Daily Workouts",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 230,
                    width: double.infinity,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return WorkoutCard();
                      }
                    ),
                  ),
                  Text((listController.hasClients
                      ? listController.position.toString()
                      : "No pos")),
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
      ),
    );
  }
}
