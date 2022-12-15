import 'package:FitStack/features/relationship/presentation/organism/friends_relationship_view.dart';
import 'package:FitStack/features/relationship/presentation/organism/trainer_relationship_view.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';

class RelationshipPage extends StatelessWidget {
  const RelationshipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(15, topPadding, 15, 0),
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: BasicPageHeader(title: "Relationships", color: Theme.of(context).colorScheme.onBackground),),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TabBar(
                  unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onBackground),
                  unselectedLabelColor: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
                  indicator: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
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
