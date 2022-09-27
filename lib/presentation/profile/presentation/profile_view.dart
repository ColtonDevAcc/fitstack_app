import 'package:FitStack/presentation/profile/presentation/molecules/user_profile_header.dart';
import 'package:FitStack/presentation/profile/presentation/organisms/profile_drawer.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: globalKey,
      endDrawer: ProfileDrawer(),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => globalKey.currentState!.openEndDrawer(),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(
                  FontAwesomeIcons.bars,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Column(
          children: [
            BasicViewHeader(title: 'Profile'),
            SizedBox(height: 10),
            UserProfileHeader(),
          ],
        ),
      ),
    );
  }
}
