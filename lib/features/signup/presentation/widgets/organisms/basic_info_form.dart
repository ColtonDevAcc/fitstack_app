import 'package:fitstackapp/widgets/atoms/textfield_widget.dart';
import 'package:flutter/material.dart';

class BasicInfoForm extends StatelessWidget {
  BasicInfoForm({Key? key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextField_Widget(
              controller: firstNameController,
              title: "First Name",
              hintText: "First Name",
            ),
            TextField_Widget(
              controller: lastNameController,
              title: "Last Name",
              hintText: "Last Name",
            ),
            TextField_Widget(
              controller: emailController,
              title: "Email",
              hintText: "Email",
            ),
            TextField_Widget(
              controller: passController,
              title: "Password",
              hintText: "Password",
            ),
            TextField_Widget(
              controller: confirmPassController,
              title: "Confirm Password",
              hintText: "Confirm Password",
            ),
          ],
        ),
      ),
    );
  }
}
