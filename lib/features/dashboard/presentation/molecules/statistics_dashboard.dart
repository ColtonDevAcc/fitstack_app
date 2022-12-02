import 'package:FitStack/features/dashboard/presentation/atoms/progressBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Statistics_Dashboard extends StatelessWidget {
  const Statistics_Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProgressBar(
            barColor: Color.fromRGBO(253, 117, 5, 1),
            totalValue: 100,
            partialValue: 73,
            icon: FontAwesome.droplet,
          ),
          ProgressBar(
            barColor: Color.fromRGBO(87, 54, 232, 1),
            totalValue: 100,
            partialValue: 88,
            icon: FontAwesome.jug_detergent,
          ),
          ProgressBar(
            barColor: Theme.of(context).colorScheme.tertiary,
            totalValue: 100,
            partialValue: 25,
            icon: FontAwesome.fire,
          ),
        ],
      ),
    );
  }
}
