import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUpFullscreenTextfield extends StatelessWidget {
  final void Function(String?)? onChanged;
  final String name;
  final String? Function(String?)? validator;

  const SignUpFullscreenTextfield({
    Key? key,
    this.onChanged,
    this.validator,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: 'Enter here',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0),
          ),
        ),
      ),
      name: name,
    );
  }
}
