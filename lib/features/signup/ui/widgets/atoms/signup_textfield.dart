import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignupTextfield extends StatelessWidget {
  final String? hintText;
  final String title;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? suffixText;
  final String? fieldName;
  final AutovalidateMode? autovalidateMode;
  final void Function(String?)? onSubmitted;
  final TextInputType? keyboardType;

  const SignupTextfield({
    Key? key,
    this.hintText,
    this.onChanged,
    this.validator,
    required this.title,
    this.suffixText,
    this.fieldName,
    this.autovalidateMode,
    this.onSubmitted,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        FormBuilderTextField(
          autovalidateMode: autovalidateMode ?? AutovalidateMode.always,
          keyboardType: keyboardType ?? TextInputType.number,
          name: fieldName ?? title,
          onChanged: onChanged,
          style: Theme.of(context).textTheme.subtitle2,
          validator: validator,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 40),
            suffixIcon: suffixText != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).colorScheme.secondary),
                      ),
                      child: Center(
                        child: Text(
                          suffixText!,
                          textScaleFactor: .8,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  )
                : null,
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
        )
      ],
    );
  }
}
