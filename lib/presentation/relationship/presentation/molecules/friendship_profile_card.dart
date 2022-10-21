import 'package:FitStack/presentation/signup/presentation/atoms/profile_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FriendshipProfileCard extends StatelessWidget {
  final Color colorTheme;
  final String? position;
  final String username;
  final String? avatar;
  final bool? accepted;

  const FriendshipProfileCard({
    Key? key,
    required this.colorTheme,
    this.position,
    required this.username,
    this.avatar,
    this.accepted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileAvatar(withBorder: false, avatar: avatar),
      title: Text(username),
      subtitle: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(colorTheme),
          value: .5,
          minHeight: 10,
        ),
      ),
      trailing: accepted != null && accepted == false
          ? Container(
              child: Icon(FontAwesomeIcons.check, color: Colors.green),
            )
          : SizedBox(),
    );
  }
}
