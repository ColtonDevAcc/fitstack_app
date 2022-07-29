import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextField_Widget extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? bottomTitle;
  final TextEditingController? controller;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;

  TextField_Widget({
    Key? key,
    this.onEditingComplete,
    required this.title,
    this.bottomTitle,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        FormBuilderTextField(
          keyboardType: keyboardType,
          onEditingComplete: onEditingComplete,
          autovalidateMode: AutovalidateMode.always,
          onChanged: onChanged ?? null,
          name: title,
          validator: validator,
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
      ],
    );
  }
}
