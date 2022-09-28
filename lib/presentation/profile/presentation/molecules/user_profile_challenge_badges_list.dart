import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileChallengeBadgesList extends StatelessWidget {
  const UserProfileChallengeBadgesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              Text('Challenges', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Text('(10 wins)'),
              Spacer(flex: 1),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "more",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.blue,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: 80,
                width: 80,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: 80,
                width: 80,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: 80,
                width: 80,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(60),
                ),
                height: 80,
                width: 80,
              ),
            ],
          ),
        )
      ],
    );
  }
}
