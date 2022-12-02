import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ListHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  const ListHeader({
    Key? key,
    required this.title,
    this.onTap,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Text(subtitle ?? ""),
        Spacer(flex: 1),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "more",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Icon(
                FontAwesome.chevron_right,
                color: Colors.blue,
                size: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
