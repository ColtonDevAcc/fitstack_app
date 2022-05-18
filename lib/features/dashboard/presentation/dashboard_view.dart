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
  int currIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.5);
  //final PageController _pageController = PageController();

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
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Stats",
                    style: Theme.of(context).textTheme.subtitle2,
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
                      clipBehavior: Clip.none,
                      pageSnapping: false,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currIndex = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Transform.translate(
                          offset: Offset(-80, 0),
                          child: AnimatedScale(
                            scale: index == currIndex ? 1.05 : 0.9,
                            child: WorkoutCard(),
                            duration: Duration(milliseconds: 200),
                          ),
                        );
                      },
                    ),
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
      ),
    );
  }
}
