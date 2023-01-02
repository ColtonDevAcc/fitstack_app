import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportTabContainer extends StatelessWidget {
  final DateTime date;

  const ReportTabContainer({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('E');
    final formatted = format.format(date);
    return Container(
      width: 80,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formatted,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          Tab(text: date.day.toString(), height: 35),
        ],
      ),
    );
  }
}
