import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAvatar extends StatelessWidget {
  final double? maxRadius;
  final String? avatar;
  final Bloc? bloc;
  final void Function()? onTap;
  final bool withBorder;
  const ProfileAvatar({Key? key, this.maxRadius, required this.avatar, required this.withBorder, this.onTap, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? url;
    try {
      if (avatar != null || avatar != "") url = avatar?.split("/")[2];
    } catch (e) {
      log("$e while trying to parse image");
    }
    return FutureBuilder(
      future: avatar == null || avatar == "" ? null : FirebaseStorage.instance.ref(url).getDownloadURL(),
      builder: (context, snapshot) {
        String? url = snapshot.hasData ? snapshot.data as String : null;
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
