import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Workout'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('data'),
                Container(
                  color: Colors.red,
                  height: 500,
                  child: Timeline.tileBuilder(
                    theme: TimelineThemeData(),
                    builder: TimelineTileBuilder.fromStyle(
                      contentsAlign: ContentsAlign.basic,
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text('Timeline Event $index'),
                      ),
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
