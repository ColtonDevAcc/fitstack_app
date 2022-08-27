import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.barColor, required this.totalValue, required this.partialValue, required this.icon}) : super(key: key);
  final Color barColor;
  final double totalValue;
  final double partialValue;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 2,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                maxRadius: 18,
                child: FaIcon(icon, color: barColor, size: 18),
                foregroundColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ' ' + ((partialValue / totalValue) * 100).round().toString() + '%',
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
                  //TODO make this not a media query
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

// Stack(
                //   children: [
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: Colors.grey[200],
                //       ),
                //     ),
                //     FractionallySizedBox(
                //       widthFactor: (partialValue / totalValue),
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: barColor,
                //         ),
                //       ),
                //     )
                //   ],
                // ),