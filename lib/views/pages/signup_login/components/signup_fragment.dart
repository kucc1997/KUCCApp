import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_button.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_textfield.dart';

// Keep this in model
class SignUpData {
  final String fullName;
  final String email;
  final String number;
  final String password;

  SignUpData({required this.fullName, required this.email, required this.number, required this.password});
}

class SignUpFragment extends HookWidget {
  final void Function(SignUpData?) onSignUpClick; // nullabe just for debugging
  final void Function() onWantToLoginClick;
  double? availableHeight;

  SignUpFragment({super.key, required this.onSignUpClick, required this.onWantToLoginClick});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      availableHeight ??= constraints.maxHeight;

      return SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: availableHeight!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 28)),
                  // Make use of textStyle: Theme.of(context).textTheme.displayLarge,
                  Text("Create an Account",
                      style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
                  const Padding(padding: EdgeInsets.only(top: 4)),
                  Text("Connect with your friends today!",
                      style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                  const Padding(padding: EdgeInsets.only(top: 28)),
                  const LSTextField(
                    placeholder: "Enter your full name",
                  ),
                  const LSTextField(
                    placeholder: "Enter your email",
                  ),
                  const LSTextField(
                    placeholder: "Enter your phone number",
                  ),
                  const LSTextField(
                    placeholder: "Enter your password",
                  ),
                  const LSTextField(
                    placeholder: "Confirm your password",
                  ),
                  const Padding(padding: EdgeInsets.only(top: 18)),
                  LSButton(
                    onTap: () {
                      onSignUpClick(null);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              WantToLogin(onWantToLoginClick: onWantToLoginClick)
            ],
          ),
        ),
      );
    });
  }
}

class WantToLogin extends StatelessWidget {
  final void Function() onWantToLoginClick;

  const WantToLogin({super.key, required this.onWantToLoginClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an account? ",
            style: TextStyle(fontSize: 18),
          ),
          InkWell(
            onTap: onWantToLoginClick,
            child: const Text(
              "Login",
              style: TextStyle(color: Color(0xFF2F89FC), fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
