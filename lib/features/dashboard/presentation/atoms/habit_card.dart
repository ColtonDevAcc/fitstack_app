import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final List<Widget>? child;
  const HabitCard({Key? key, this.height, this.width, this.color, this.padding, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 100,
        width: width ?? 100,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: child != null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: child!,
                ),
              )
            : null,
      ),
    );
  }
}
