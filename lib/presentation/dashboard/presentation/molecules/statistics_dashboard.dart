import 'package:FitStack/presentation/dashboard/presentation/atoms/progressBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            icon: FontAwesomeIcons.droplet,
          ),
          ProgressBar(
            barColor: Color.fromRGBO(87, 54, 232, 1),
            totalValue: 100,
            partialValue: 88,
            icon: FontAwesomeIcons.jugDetergent,
          ),
          ProgressBar(
            barColor: Theme.of(context).colorScheme.tertiary,
            totalValue: 100,
            partialValue: 25,
            icon: FontAwesomeIcons.fire,
          ),
        ],
      ),
    );
  }
}
