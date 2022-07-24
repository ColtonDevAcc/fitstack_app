import 'dart:io';

import 'package:flutter/material.dart';

class PlatHealthFillButton extends StatelessWidget {
  const PlatHealthFillButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool platform = Platform.isAndroid;
    return Container(
      padding: EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            platform ? 'assets/app/icons/googleFit.png' : 'assets/app/icons/healthKit.png',
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Text(
            "Fill with ${platform ? "Google Fit" : "Apple Health"}",
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.surface),
          ),
        ],
      ),
    );
  }
}
