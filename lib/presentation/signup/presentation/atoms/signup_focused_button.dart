import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp_Focused_Button_Widget extends StatelessWidget {
  final String text;
  final int index;
  final void Function()? onPressed;
  const SignUp_Focused_Button_Widget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 20),
          ],
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width * 0.8,
        duration: Duration(milliseconds: 2000),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedAlign(
                duration: Duration(milliseconds: 500),
                alignment: index > 0 ? Alignment.centerLeft : Alignment.center,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
              AnimatedAlign(
                duration: Duration(milliseconds: 500),
                alignment: index > 0 ? Alignment.centerRight : Alignment.center,
                child: FaIcon(
                  FontAwesomeIcons.arrowRight,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
