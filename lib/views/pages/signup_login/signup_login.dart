import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kucc_app/viewmodels/signup_login_viewmodel.dart';
import 'package:kucc_app/views/pages/signup_login/components/forgot_password_fragment.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_fragment.dart';
import 'package:kucc_app/views/pages/signup_login/components/logo.dart';
import 'package:kucc_app/views/pages/signup_login/components/signup_fragment.dart';

class SignupLogin extends HookWidget {
  const SignupLogin({super.key});

  @override
  Widget build(BuildContext context) {
    //final SignupLoginViewModel signupLoginViewModel = Provider.of<SignupLoginViewModel>(context);
    final tabController = useTabController(initialLength: 3);
    // User will go to Login fragment
    void onWantToLoginClick() {
      tabController.index = 0;
    }

    // User will go to the SignUp fragment
    void onWantToSignUpClick() {
      tabController.index = 1;
    }

    // User will go to Forgot Password fragment
    void onForgotPasswordClick() {
      tabController.index = 2;
      // make use of viewmode's call here
    }

    void onSignUpClick() {}

    void onLoginClick(String email, String password) {}

    return Scaffold(
      backgroundColor: Colors.white, // change with theme
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 66),
          alignment: Alignment.center,
          width: 320,
          child: Column(
            children: [
              const Logo(
                height: 110,
                width: 136,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    LoginFragment(
                        onWantToSignUpClick: onWantToSignUpClick, onForgotPasswordClick: onForgotPasswordClick, onLoginClick: onLoginClick),
                    SignUpFragment(onSignUpClick: onSignUpClick, onWantToLoginClick: onWantToLoginClick),
                    ForgotPasswordFragment(onSignUpClick: onSignUpClick, onWantToLoginClick: onWantToLoginClick)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
