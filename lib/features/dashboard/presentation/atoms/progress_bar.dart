import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.barColor, required this.totalValue, required this.partialValue, required this.icon}) : super(key: key);
  final Color barColor;
  final double totalValue;
  final double partialValue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Center(
            child: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 2,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                maxRadius: 18,
                foregroundColor: Theme.of(context).colorScheme.surface,
                child: Icon(icon, color: barColor, size: 18),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' ${((partialValue / totalValue) * 100).round()}%',
                style: TextStyle(
                  color: barColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 6,
                  width: MediaQuery.of(context).size.width * .8 - 20,
                  child: LinearProgressIndicator(
                    backgroundColor: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                    color: barColor,
                    value: partialValue / 100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
