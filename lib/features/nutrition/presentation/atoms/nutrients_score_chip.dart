import 'package:flutter/material.dart';

class NutrientsScoreChip extends StatelessWidget {
  final IconData icon;
  final String? value;
  const NutrientsScoreChip({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Icon(icon, color: Theme.of(context).colorScheme.onBackground),),
          const SizedBox(width: 10),
          Text(
            "${value ?? 0}",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
