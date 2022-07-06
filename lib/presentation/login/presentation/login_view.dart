import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitstackapp/data/routing/appRouter.gr.dart';
import 'package:fitstackapp/presentation/login/cubit/login_cubit.dart';
import 'package:fitstackapp/widgets/atoms/focusedButton_widget.dart';
import 'package:fitstackapp/widgets/atoms/socialAuthButton_widget.dart';
import 'package:fitstackapp/widgets/atoms/textfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login_View extends StatefulWidget {
  Login_View({Key? key}) : super(key: key);

  @override
  State<Login_View> createState() => _Login_ViewState();
}

class _Login_ViewState extends State<Login_View> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If the snapshot has user data, then they're already signed in. So Navigating to the Dashboard.
          if (snapshot.hasData) {
            User? firebaseUser = snapshot.data;
            log('pushing to mainview with //==== ${firebaseUser} ====//');
            AutoRouter.of(context).replace(MainViewRouter());
          }
          //! Otherwise, they're not signed in. Show the sign in page.
          return Scaffold(
              body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: SvgPicture.asset(
                      'assets/app/icons/AppLogo.svg',
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'LETS SIGN YOU IN,',
                    textScaleFactor: 1.6,
                    //style: TextStyle(color: Theme.of(context).primaryColor),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome Back you\'ve\nbeen missed!',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
                        ),
                  ),
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Spacer(flex: 2),
                          TextField_Widget(
                            validator: (value) {
                              return value != null && !EmailValidator.validate(value)
                                  ? 'Enter a valid email'
                                  : null;
                            },
                            controller: emailController,
                            title: "Email",
                            hintText: 'Username or Email',
                          ),
                          SizedBox(height: 15),
                          TextField_Widget(
                            controller: passwordController,
                            validator: (value) {
                              return value != null && value.length < 6
                                  ? "Enter min. 6 characters"
                                  : null;
                            },
                            title: "Password",
                            bottomTitle: "Forgot Password?",
                            hintText: 'Password',
                          ),
                          Spacer(flex: 4),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(.7),
                        ),
                        text: "Don't have an account? ",
                        children: [
                          TextSpan(
                            text: "      Sign Up!",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(context).pushNamed('/signup');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: FocusedButton_Widget(
                      text: "SIGN IN",
                      onPressed: () {
                        authenticateWithEmailAndPassword(context);
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialAuthButton_Widget(
                        color: Color.fromRGBO(45, 113, 197, 1),
                        child: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(width: 15),
                      SocialAuthButton_Widget(
                        onTap: () {
                          // authenticateWithGoogle(context);
                        },
                        color: Color.fromRGBO(254, 78, 78, 1),
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
          ));
        },
      ),
    );
  }

  void authenticateWithEmailAndPassword(context) {
    if (formKey.currentState!.validate()) {
      // If email is valid adding new Event [SignInRequested].
      context
          .read<LoginCubit>()
          .logInWithCredentials(emailController.text, passwordController.text);
    }
  }

  // void authenticateWithGoogle(context) {
  //   BlocProvider.of<AuthBloc>(context).add(
  //     GoogleSignInRequested(),
  //   );
  // }
}
