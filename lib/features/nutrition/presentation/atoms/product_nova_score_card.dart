import 'package:flutter/material.dart';

class ProductNovaScoreCard extends StatelessWidget {
  final int? novaScore;
  final String? nutraScore;
  const ProductNovaScoreCard({
    Key? key,
    required this.novaScore,
    required this.nutraScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> novaScoreColorList = [
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Theme.of(context).colorScheme.error,
    ];

    final Map<String, Color> nutraScoreColorMap = {
      "a": Colors.green,
      "b": Colors.yellow,
      "c": Colors.orange,
      "d": Theme.of(context).colorScheme.error,
      "e": Theme.of(context).colorScheme.error,
    };

    return nutraScore != null || novaScore != null
        ? Container(
            decoration: BoxDecoration(
              color: nutraScore != null ? nutraScoreColorMap[nutraScore] : novaScoreColorList[novaScore! - 1],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: nutraScore == ""
                ? Text(
                    "${nutraScore?.toUpperCase()}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
                  )
                : Text(
                    "${novaScore ?? 0}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
                  ),
          )
        : SizedBox();
  }
}
