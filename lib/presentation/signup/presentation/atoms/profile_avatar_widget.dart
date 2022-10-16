import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAvatar extends StatelessWidget {
  final double? maxRadius;
  final String? profileUrl;
  final void Function()? onTap;
  final bool withBorder;
  const ProfileAvatar({Key? key, this.maxRadius, required this.profileUrl, required this.withBorder, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: profileUrl == null || profileUrl == "" ? null : FirebaseStorage.instance.ref(profileUrl?.split("/")[2]).getDownloadURL(),
      builder: (context, snapshot) {
        String? url = snapshot.hasData ? snapshot.data as String : null;
        log("LOADING NEW PROFILE IMAGE");
        return withBorder
            ? GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.transparent,
                    border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
                  ),
                  child: CircleAvatar(
                    maxRadius: maxRadius ?? 30,
                    child: url == null || url == "" ? FaIcon(FontAwesomeIcons.camera) : null,
                    foregroundImage: url == null || url == "" ? null : NetworkImage(url),
                  ),
                ),
              )
            : GestureDetector(
                onTap: onTap,
                child: CircleAvatar(
                  maxRadius: maxRadius ?? 30,
                  child: url == null || url == "" ? FaIcon(FontAwesomeIcons.camera) : null,
                  foregroundImage: url == null || url == "" ? null : NetworkImage(url),
                ),
              );
      },
    );
  }
}
