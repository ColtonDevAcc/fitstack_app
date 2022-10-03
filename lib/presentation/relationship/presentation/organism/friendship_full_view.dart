import 'package:FitStack/presentation/relationship/presentation/atom/friend_list_tile.dart';
import 'package:FitStack/presentation/relationship/presentation/molecules/add_friend_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class FriendshipFullView extends StatelessWidget {
  const FriendshipFullView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () => scaffoldKey.currentState?.showBottomSheet((context) => AddFriendBottomSheet()),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(FontAwesomeIcons.plus),
      ),
      appBar: AppBar(
        title: Text(
          "Friends",
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
        leading: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Container(
              child: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            )),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            FriendListTile(accepted: true, userFullName: 'Colton Bristow', username: 'ColtonDevAcc'),
          ],
        ),
      ),
    );
  }
}
