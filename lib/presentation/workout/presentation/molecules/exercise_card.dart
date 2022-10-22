import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      expandedTextColor: Theme.of(context).colorScheme.secondary,
      subtitle: Text('Shoulders'),
      title: Text('Exercise'),
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
            columns: [
              DataColumn(label: Text('set'), numeric: true),
              DataColumn(label: Text('reps'), numeric: true),
              DataColumn(label: Text('weight'), numeric: true),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('1')),
                  DataCell(Text('22')),
                  DataCell(Text('100lbs')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('2')),
                  DataCell(Text('22')),
                  DataCell(Text('100lbs')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('3')),
                  DataCell(Text('22')),
                  DataCell(Text('100lbs')),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
