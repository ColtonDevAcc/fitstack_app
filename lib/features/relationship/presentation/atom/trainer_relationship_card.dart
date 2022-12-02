import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class TrainerRelationshipCard extends StatelessWidget {
  const TrainerRelationshipCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img/https://www.thimble.com/wp-content/uploads/2022/05/Personal-Trainer-Salary-Guide-1200x800.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: Theme.of(context).colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Colton Bristow',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                FontAwesome.location_dot,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Text(
                'Oklahoma',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
