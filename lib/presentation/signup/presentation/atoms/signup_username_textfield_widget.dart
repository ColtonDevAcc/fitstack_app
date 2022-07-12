import 'dart:developer';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp_fullscreen_Textfield_Widget extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  const SignUp_fullscreen_Textfield_Widget({
    Key? key,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
