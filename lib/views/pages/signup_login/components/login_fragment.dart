import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_button.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_textfield.dart';

class LSCheckbox extends HookWidget {
  final bool value;
  final Function(bool) onChange;
  final Widget trailingWidget;

  const LSCheckbox({super.key, required this.value, required this.onChange, required this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    final _value = useState(value);

    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), border: Border.all(color: Color(0xFFCDD1E0), width: 2)),
          child: SizedBox(
            height: 18.0,
            width: 18.0,
            child: Checkbox(
              side: const BorderSide(color: Colors.transparent),
              value: _value.value,
              onChanged: (v) {
                _value.value = v!;
                onChange(v);
              },
              checkColor: const Color(0xFF000C14),
              activeColor: Colors.transparent,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8),
          child: trailingWidget,
        )
      ],
    );
  }
}

class LoginFragment extends HookWidget {
  final void Function() onWantToSignUpClick;
  final void Function() onForgotPasswordClick;
  final void Function(String, String) onLoginClick;

  const LoginFragment({super.key, required this.onWantToSignUpClick, required this.onForgotPasswordClick, required this.onLoginClick});

  @override
  Widget build(BuildContext context) {
    final rememberMe = useState(true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 28)),
            Text("Hi, Welcome Back!👋",
                // Make use of textStyle: Theme.of(context).textTheme.displayLarge,
                style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
            const Padding(padding: EdgeInsets.only(top: 28)),
            const LSTextField(
              label: "Email",
              placeholder: "example@gmail.com",
            ),
            const Padding(padding: EdgeInsets.only(top: 18)),
            const LSTextField(
              label: "Password",
              placeholder: "Enter your password",
            ),
            const Padding(padding: EdgeInsets.only(top: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LSCheckbox(
                  value: rememberMe.value,
                  onChange: (v) => rememberMe.value = v,
                  trailingWidget: const Text(
                    "Remember Me",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: onForgotPasswordClick,
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xFFE86969)),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 18)),
            LSButton(
              onTap: () {
                onLoginClick("email", "password");
              },
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        WantToSignUp(onWantToSignUpClick: onWantToSignUpClick)
      ],
    );
  }
}

class WantToSignUp extends StatelessWidget {
  final void Function() onWantToSignUpClick;

  const WantToSignUp({super.key, required this.onWantToSignUpClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Dont have an account? ",
            style: TextStyle(fontSize: 18),
          ),
          InkWell(
            onTap: onWantToSignUpClick,
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Color(0xFF2F89FC), fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
