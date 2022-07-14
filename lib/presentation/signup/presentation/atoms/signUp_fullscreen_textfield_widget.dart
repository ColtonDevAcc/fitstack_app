import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUp_Fullscreen_Textfield_Widget extends StatelessWidget {
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final GlobalKey<FormBuilderState> formKey;

  const SignUp_Fullscreen_Textfield_Widget({
    required this.formKey,
    Key? key,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: FormBuilderTextField(
        onChanged: onChanged,
        keyboardType: keyboardType ?? TextInputType.number,
        style: TextStyle(color: Colors.black),
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
        name: '',
      ),
    );
  }
}
