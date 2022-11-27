import 'package:FitStack/features/relationship/cubit/friendship/friendship_cubit.dart';
import 'package:FitStack/features/relationship/presentation/molecules/add_friend_bottom_sheet.dart';
import 'package:FitStack/features/relationship/presentation/molecules/friendship_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FriendsRelationshipView extends StatelessWidget {
  final bool? appBar;
  const FriendsRelationshipView({Key? key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocBuilder<FriendshipCubit, FriendshipState>(
      buildWhen: (previous, current) =>
          previous.friendsList != current.friendsList || previous.showAddFriend != current.showAddFriend || previous.friend != current.friend,
      builder: (context, state) {
        if (state.friends == null || state.friends!.isEmpty) {
          BlocProvider.of<FriendshipCubit>(context).getFriendsList();
        }
        return Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<FriendshipCubit>().setShowAddFriend(true);
              showMaterialModalBottomSheet(
                context: context,
                useRootNavigator: true,
                builder: (context) => Container(
                  height: 450,
                  child: AddFriendBottomSheet(
                    friend: context.watch<FriendshipCubit>().state.friend,
                  ),
                ),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(FontAwesomeIcons.plus),
          ),
          appBar: appBar == null
              ? AppBar(
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
                )
              : null,
          body: SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            child: Column(
              children: state.friendsList == null
                  ? []
                  : state.friendsList!
                      .map(
                        (e) => FriendshipProfileCard(
                          username: e!.display_name,
                          colorTheme: Colors.red,
                        ),
                      )
                      .toList(),
            ),
          ),
        );
      },
    );
  }
}