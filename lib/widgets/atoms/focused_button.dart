import 'package:flutter/material.dart';

class FocusedButton extends StatelessWidget {
  final Widget title;
  final void Function()? onPressed;
  const FocusedButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 20),
          ],
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: title,
        ),
      ),
    );
  }
}
