import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingUp_Stats_Card_widget extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  const SingUp_Stats_Card_widget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.fire,
          color: Colors.red,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(subtitle),
          ],
        )
      ],
    );
  }
}
