import 'package:FitStack/features/dashboard/presentation/atoms/workout_recommendation_card.dart';
import 'package:flutter/material.dart';

class Workout_Recommendation_List extends StatefulWidget {
  final PageController pageController;

  const Workout_Recommendation_List({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<Workout_Recommendation_List> createState() => _Workout_Recommendation_ListState();
}

class _Workout_Recommendation_ListState extends State<Workout_Recommendation_List> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      width: double.infinity,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: widget.pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Transform.translate(
            offset: const Offset(-95, 0),
            child: AnimatedScale(
              scale: index == currentIndex ? 1.05 : 0.9,
              duration: const Duration(milliseconds: 200),
              child: const Workout_Recommendation_Card(),
            ),
          );
        },
      ),
    );
  }
}
