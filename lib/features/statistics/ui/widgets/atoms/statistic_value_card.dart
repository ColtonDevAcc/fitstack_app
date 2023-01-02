import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class StatisticValueCard extends StatelessWidget {
  final String title;
  final String value;
  final String emoji;
  final Color? color;
  const StatisticValueCard({
    Key? key,
    required this.title,
    required this.value,
    required this.emoji,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parser = EmojiParser();

    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * .25,
      height: 125,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: color ?? Theme.of(context).colorScheme.surface),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: AutoSizeText(
              parser.emojify(emoji),
              textScaleFactor: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
            ),
          ),
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
