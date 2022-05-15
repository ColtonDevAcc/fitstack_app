import 'package:fitstackapp/app/views/login/widgets/socialAuthButton_widget.dart';
import 'package:fitstackapp/widgets/focusedButton_widget.dart';
import 'package:fitstackapp/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SvgPicture.asset(
                  'assets/app/icons/Asset 1.svg',
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'LETS SIGN YOU IN,',
                //TODO: change to something that applies with accessibility
                textScaleFactor: 1.6,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Welcome Back you\'ve\nbeen missed!',
                textScaleFactor: 1.6,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Spacer(flex: 2),
              TextField_Widget(
                title: "Email",
                hintText: 'Username or Email',
              ),
              SizedBox(height: 15),
              TextField_Widget(
                title: "Password",
                bottomTitle: "Forgot Password?",
                hintText: 'Password',
              ),
              Spacer(flex: 4),
              Center(
                child: FocusedButton_Widget(text: "SIGN IN"),
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocailAuthButton_Widget(
                    color: Theme.of(context).colorScheme.primary,
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(width: 15),
                  SocailAuthButton_Widget(
                    color: Theme.of(context).colorScheme.secondary,
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
