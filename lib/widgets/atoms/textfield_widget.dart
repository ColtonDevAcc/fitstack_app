import 'package:flutter/material.dart';

class TextField_Widget extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? bottomTitle;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  TextField_Widget({
    Key? key,
    required this.title,
    this.bottomTitle,
    this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textScaleFactor: 1.4,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: 10),
          TextFormField(
            onChanged: (value) => controller.text = value,
            validator: validator,
            autovalidateMode: validator == null ? null : AutovalidateMode.onUserInteraction,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
          ),
          SizedBox(height: 5),
          if (bottomTitle != null)
            Text(
              bottomTitle!,
              style: Theme.of(context).textTheme.subtitle2,
            ),
        ],
      ),
    );
  }
}
