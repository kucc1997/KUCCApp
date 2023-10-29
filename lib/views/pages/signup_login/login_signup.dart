import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kucc_app/models/model/login_data.dart';
import 'package:kucc_app/viewmodels/signup_login_viewmodel.dart';
import 'package:kucc_app/views/pages/signup_login/components/forgot_password_fragment.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_fragment.dart';
import 'package:kucc_app/views/pages/signup_login/components/logo.dart';
import 'package:kucc_app/views/pages/signup_login/components/signup_fragment.dart';
import 'package:provider/provider.dart';

class LoginSignUp extends HookWidget {
  const LoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupLoginViewModel slViewModel = Provider.of<SignupLoginViewModel>(context);
    final tabController = useTabController(initialLength: 3);

    void onWantToLogin() {
      if (slViewModel.canGoToSignUpOrLogin) {
        tabController.index = 0;
      }
    }

    void onWantToSignUp() {
      if (slViewModel.canGoToSignUpOrLogin) {
        tabController.index = 1;
      }
    }

    void onForgotPassword() {
      if (slViewModel.canGoToSignUpOrLogin) {
        tabController.index = 2;
      }
    }

    Future<bool> onWillPop() async {
      if (tabController.index == 1 || tabController.index == 2) {
        onWantToLogin();
        return false;
      }
      return true;
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
                        onWantToSignUpClick: onWantToSignUp,
                        onForgotPasswordClick: onForgotPassword,
                      ),
                      SignUpFragment(onWantToLoginClick: onWantToLogin),
                      ForgotPasswordFragment(
                          onSignUpClick: () {}, //
                          onWantToLoginClick: onWantToLogin)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
