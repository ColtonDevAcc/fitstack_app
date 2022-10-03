import 'package:FitStack/widgets/atoms/Profile_picture_avatar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FriendshipProfileCard extends StatelessWidget {
  final Color colorTheme;
  final String position;

  const FriendshipProfileCard({
    Key? key,
    required this.colorTheme,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          children: [
            Container(
              width: 40,
              child: AutoSizeText(
                position,
                minFontSize: 20,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: colorTheme, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 3),
            ProfilePictureAvatar(withBorder: false, maxRadius: 35),
            SizedBox(width: 3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'user friend name',
                    minFontSize: 16,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(colorTheme),
                      value: .5,
                      minHeight: 10,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
