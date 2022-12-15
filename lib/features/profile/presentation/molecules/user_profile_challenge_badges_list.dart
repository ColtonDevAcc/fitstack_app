import 'package:FitStack/widgets/atoms/list_header.dart';
import 'package:flutter/material.dart';

class UserProfileChallengeBadgesList extends StatelessWidget {
  const UserProfileChallengeBadgesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListHeader(title: "Challenges", subtitle: '(10 wins)'),
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
