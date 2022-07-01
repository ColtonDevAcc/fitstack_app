import 'package:flutter/material.dart';

class FocusedButton_Widget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const FocusedButton_Widget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 20),
          ],
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
