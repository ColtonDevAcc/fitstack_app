import 'package:FitStack/features/relationship/presentation/organism/friends_relationship_view.dart';
import 'package:FitStack/features/relationship/presentation/organism/trainer_relationship_view.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';

class RelationshipPage extends StatelessWidget {
  const RelationshipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasicPageHeader(
              title: "Relationships",
              color: Theme.of(context).colorScheme.onBackground,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TabBar(
                  unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                  indicator: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
                  tabs: const [
                    Text('Groups'),
                    Text('Friends'),
                    Text('Trainers'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Expanded(
              child: TabBarView(
                children: [
                  TrainerRelationshipView(),
                  FriendsRelationshipView(appBar: false),
                  TrainerRelationshipView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
