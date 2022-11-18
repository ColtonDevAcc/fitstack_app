import 'package:flutter/material.dart';

class ProfileDrawerListTile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  const ProfileDrawerListTile({Key? key, this.onTap, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Theme.of(context).colorScheme.surface,
      dense: true,
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onBackground,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );
  }
}
