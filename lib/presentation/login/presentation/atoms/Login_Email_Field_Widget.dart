import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/widgets/atoms/textfield_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login_Email_Field_Widget extends StatelessWidget {
  const Login_Email_Field_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField_Widget(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email ?? ""),
          validator: (value) {
            return value != null && !EmailValidator.validate(value) ? 'Enter a valid email' : null;
          },
          title: "Email",
          hintText: 'Username or Email',
        );
      },
    );
  }
}
