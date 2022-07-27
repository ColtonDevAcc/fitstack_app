import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile_Avatar_Widget extends StatelessWidget {
  final double? maxRadius;
  final String? image;
  const Profile_Avatar_Widget({Key? key, this.maxRadius, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.transparent,
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
      ),
      child: CircleAvatar(
        maxRadius: maxRadius ?? 30,
        child: image == null ? FaIcon(FontAwesomeIcons.camera) : null,
        foregroundImage: image == null ? null : NetworkImage(image!),
      ),
    );
  }
}
