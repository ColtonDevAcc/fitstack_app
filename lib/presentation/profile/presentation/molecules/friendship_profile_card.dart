import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class FriendshipProfileCard extends StatelessWidget {
  final Color colorTheme;
  final String position;
  final String username;
  final String? profileUrl;

  const FriendshipProfileCard({
    Key? key,
    required this.colorTheme,
    required this.position,
    required this.username,
    this.profileUrl,
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
            ProfileAvatar(withBorder: false, profileUrl: profileUrl),
            SizedBox(width: 3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    username,
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
