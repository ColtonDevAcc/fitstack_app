import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FriendListTile extends StatelessWidget {
  final bool accepted;
  final String username;
  const FriendListTile({Key? key, required this.accepted, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        title: AutoSizeText(
          username,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: AutoSizeText(username, minFontSize: 6),
        leading: CircleAvatar(),
        trailing: SizedBox(), //TODO: find something to put on the trailing widget
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          !accepted
              ? SlidableAction(
                  flex: 2,
                  onPressed: (context) {},
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.check,
                  label: 'Accept',
                )
              : SizedBox(),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            icon: Icons.radio_button_checked,
            label: 'Ping',
          ),
        ],
      ),
    );
  }
}
