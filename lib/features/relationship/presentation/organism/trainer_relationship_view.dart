import 'package:FitStack/features/relationship/presentation/atom/trainer_relationship_card.dart';
import 'package:flutter/material.dart';

class TrainerRelationshipView extends StatelessWidget {
  const TrainerRelationshipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Wrap(
                spacing: MediaQuery.of(context).size.width * .05,
                runSpacing: MediaQuery.of(context).size.width * .05,
                runAlignment: WrapAlignment.spaceBetween,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  TrainerRelationshipCard(),
                  TrainerRelationshipCard(),
                  TrainerRelationshipCard(),
                  TrainerRelationshipCard(),
                  TrainerRelationshipCard(),
                  TrainerRelationshipCard(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
