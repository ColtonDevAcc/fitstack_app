import 'package:FitStack/app/providers/cubit/fs_text_field/fs_text_field_cubit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FSTextField extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? bottomTitle;
  final Function()? onTap;
  TextEditingController? controller = TextEditingController();
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final bool? obscureText;

  FSTextField({
    Key? key,
    this.onEditingComplete,
    required this.title,
    this.bottomTitle,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.autovalidateMode,
    this.obscureText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderFieldState> formKey = GlobalKey<FormBuilderFieldState>();
    return BlocBuilder<FsTextFieldCubit, FsTextFieldState>(
      buildWhen: (previous, current) => previous.iconToggled != current.iconToggled && obscureText == true,
      builder: (context, state) {
        final bool toggled = state.iconToggled;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 10),
            FormBuilderTextField(
              // ignore: avoid_bool_literals_in_conditional_expressions
              obscureText: obscureText != null ? !toggled : false,
              keyboardType: keyboardType,
              onEditingComplete: onEditingComplete,
              autovalidateMode: autovalidateMode ?? AutovalidateMode.always,
              name: title,
              key: formKey,
              onChanged: onChanged,
              validator: validator,
              controller: controller,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                ),
                suffixIcon: obscureText != null
                    ? IconButton(
                        icon: Icon(toggled ? Icons.visibility : Icons.visibility_off, color: Theme.of(context).colorScheme.secondary),
                        onPressed: () => context.read<FsTextFieldCubit>().toggleIcon(),
                      )
                    : null,
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
            ),
            const SizedBox(height: 5),
            if (bottomTitle != null) AutoSizeText(bottomTitle!, style: Theme.of(context).textTheme.bodySmall),
          ],
        );
      },
    );
  }
}
