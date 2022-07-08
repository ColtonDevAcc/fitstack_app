import 'package:FitStack/presentation/dashboard/presentation/molecules/progressBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Statistics_Dashboard extends StatelessWidget {
  const Statistics_Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgressBar(
          barColor: Colors.orange,
          totalValue: 100,
          partialValue: 73,
          icon: FontAwesomeIcons.droplet,
        ),
        ProgressBar(
          barColor: Colors.purple,
          totalValue: 100,
          partialValue: 88,
          icon: FontAwesomeIcons.jugDetergent,
        ),
        ProgressBar(
          barColor: Colors.red,
          totalValue: 100,
          partialValue: 25,
          icon: FontAwesomeIcons.fire,
        ),
      ],
    );
  }
}
