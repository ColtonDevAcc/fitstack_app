import 'package:flutter/material.dart';

class ProfileSocialCurrencyIcon extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color? color;
  const ProfileSocialCurrencyIcon({Key? key, required this.icon, required this.value, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color ?? Theme.of(context).colorScheme.error,
        ),
        SizedBox(width: 10),
        Text(value),
      ],
    );
  }
}
