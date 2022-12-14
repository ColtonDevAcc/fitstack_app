import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WorkoutStatisticBox extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  const WorkoutStatisticBox({
    Key? key,
    required this.value,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Container(
          width: p1.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      icon,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    AutoSizeText(
                      value,
                      textScaleFactor: 1.2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                AutoSizeText(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textScaleFactor: 1,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
