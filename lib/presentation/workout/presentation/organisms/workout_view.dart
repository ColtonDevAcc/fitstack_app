import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
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
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Timeline.tileBuilder(
                    theme: TimelineThemeData(color: Theme.of(context).colorScheme.secondary),
                    builder: TimelineTileBuilder.fromStyle(
                      contentsAlign: ContentsAlign.basic,
                      nodePositionBuilder: (context, index) => 0,
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: ExpansionTileCard(
                          expandedTextColor: Theme.of(context).colorScheme.secondary,
                          subtitle: Text('Shoulders'),
                          title: Text('Exercise $index'),
                          children: [
                            SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: PlutoGrid(
                                columns: [
                                  PlutoColumn(
                                      title: 'set',
                                      field: 'set',
                                      type: PlutoColumnType.number(),
                                      width: PlutoGridSettings.minColumnWidth,
                                      minWidth: PlutoGridSettings.minColumnWidth),
                                  PlutoColumn(
                                      title: 'targetedReps',
                                      field: 'targetedReps',
                                      type: PlutoColumnType.number(),
                                      width: PlutoGridSettings.minColumnWidth,
                                      minWidth: PlutoGridSettings.minColumnWidth),
                                  PlutoColumn(
                                      title: 'TargetWeight',
                                      field: 'TargetWeight',
                                      type: PlutoColumnType.number(),
                                      width: PlutoGridSettings.minColumnWidth,
                                      minWidth: PlutoGridSettings.minColumnWidth),
                                ],
                                rows: [
                                  PlutoRow(
                                    cells: {
                                      "set": PlutoCell(value: 1, key: Key('sets')),
                                      "targetedReps": PlutoCell(value: 2, key: Key('targetedReps')),
                                      "TargetWeight": PlutoCell(value: 2, key: Key('TargetWeight')),
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      itemCount: 20,
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
