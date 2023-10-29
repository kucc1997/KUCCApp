// ignore_for_file: must_be_immutable

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/models/model/login_data.dart';
import 'package:kucc_app/viewmodels/signup_login_viewmodel.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_signup_checkbox.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_button.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_textfield.dart';
import 'package:provider/provider.dart';

class LoginFragment extends HookWidget {
  final void Function() onWantToSignUpClick;
  final void Function() onForgotPasswordClick;

  double? _availableHeight;

  LoginFragment({
    super.key,
    required this.onWantToSignUpClick,
    required this.onForgotPasswordClick, //
  });

  @override
  Widget build(BuildContext context) {
    final SignupLoginViewModel slViewModel = Provider.of<SignupLoginViewModel>(context);

    final textWidgetLoginChild = Text(
      "Login",
      style: GoogleFonts.manrope(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
    const circularWidgetLoginChild = SizedBox(
      height: 18,
      width: 18,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    );

    final rememberMe = useState(true);
    final email = useState("");
    final password = useState("");

    final loginButtonEnabled = useState(true);
    final loginButtonChildWidget = useState<Widget>(textWidgetLoginChild);

    void goToHome(BuildContext context) {
      context.go("/home");
    }

    Future<void> onLoginClick() async {
      LoginData loginData = LoginData(email: email.value, password: password.value, rememberUser: rememberMe.value);
      loginButtonEnabled.value = false;
      loginButtonChildWidget.value = circularWidgetLoginChild;

      try {
        await slViewModel.loginUser(loginData);
        loginButtonEnabled.value = true;
        loginButtonChildWidget.value = textWidgetLoginChild;
        goToHome(context);
      } catch (e) {
        loginButtonEnabled.value = false;
        loginButtonChildWidget.value = textWidgetLoginChild;
      }
    }

    return LayoutBuilder(builder: (context, constraints) {
      _availableHeight ??= constraints.maxHeight;

      return SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: _availableHeight!),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 28)),
                  Text("Hi, Welcome Back!👋",
                      // Make use of textStyle: Theme.of(context).textTheme.displayLarge,
                      style:
                          GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
                  const Padding(padding: EdgeInsets.only(top: 28)),
                  LSTextField(
                    label: "Email",
                    placeholder: "example@gmail.com",
                    onChanged: (v) => email.value = v,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  LSTextField(
                    label: "Password",
                    placeholder: "Enter your password",
                    onChanged: (v) => password.value = v,
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
                      onTap: onLoginClick, isEnabled: loginButtonEnabled.value, child: loginButtonChildWidget.value)
                ],
              ),
              WantToSignUp(onWantToSignUpClick: onWantToSignUpClick)
            ],
          ),
        ),
      );
    });
  }
}

class WantToSignUp extends StatelessWidget {
  final void Function() onWantToSignUpClick;

  const WantToSignUp({super.key, required this.onWantToSignUpClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Dont have an account? ", style: TextStyle(fontSize: 18)),
          InkWell(
            onTap: onWantToSignUpClick,
            child: const Text("Sign Up", style: TextStyle(color: Color(0xFF2F89FC), fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
