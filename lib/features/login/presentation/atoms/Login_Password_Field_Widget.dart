import 'package:FitStack/features/login/cubit/login_cubit.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_Password_Field_Widget extends StatelessWidget {
  const Login_Password_Field_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField_Widget(
      onChanged: (password) => context.read<LoginCubit>().passwordChanged(password ?? ""),
      validator: (value) {
        return value != null && value.length < 6 ? "Enter min. 6 characters" : null;
      },
      title: "Password",
      bottomTitle: "Forgot Password?",
      hintText: 'Password',
    );
  }
}
