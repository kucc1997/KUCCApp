import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_button.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_textfield.dart';

class SignUpFragment extends HookWidget {
  final void Function() onSignUpClick;
  final void Function() onWantToLoginClick;
  const SignUpFragment({super.key, required this.onSignUpClick, required this.onWantToLoginClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Create an account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const Text(
          "Connect with your friends today",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const LSTextField(
          label: "Email",
          placeholder: "example@gmail.com",
        ),
        const LSTextField(
          label: "Password",
          placeholder: "Enter your password",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Checkbox(value: value, onChanged: onChanged),
            Row(
              children: [
                Checkbox(value: false, onChanged: (x) {}),
                //
                const Text("Remember me")
              ],
            ),
            const Text("lasjfjs"),
          ],
        ),
        LSButton(
          onTap: () {
            onSignUpClick();
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
