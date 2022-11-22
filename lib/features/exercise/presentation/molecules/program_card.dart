import 'package:FitStack/features/workout/ui/widgets/atoms/saved_workout_icon.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String title;
  final String description;
  const ProgramCard({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .45,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: Stack(
                  children: [
                    Image.network(
                      'https://t4.ftcdn.net/jpg/02/51/45/49/360_F_251454966_MSoiZITSgkSgIs2qGr1SnfJOYdhd6ieJ.jpg',
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SavedWorkoutIcon(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
