import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      borderRadius: BorderRadius.circular(15),
      expandedTextColor: Theme.of(context).colorScheme.secondary,
      subtitle: const Text('Shoulders'),
      title: const Text('Exercise'),
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTable(
            decoration: const BoxDecoration(),
            columns: const [
              DataColumn(label: Text('set'), numeric: true),
              DataColumn(label: Text('reps'), numeric: true),
              DataColumn(label: Text('weight'), numeric: true),
            ],
            rows: const [
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
