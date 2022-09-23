import 'package:FitStack/presentation/relationship/presentation/molecules/friendship_card.dart';
import 'package:flutter/material.dart';

class FriendsRelationshipView extends StatelessWidget {
  const FriendsRelationshipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.start,
          children: [
            FriendshipCard(),
            FriendshipCard(),
            FriendshipCard(),
          ],
        )
      ],
    );
  }
}
