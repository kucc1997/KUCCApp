import 'package:flutter/material.dart';
import 'package:kucc_app/models/model/login_data.dart';
import 'package:kucc_app/views/pages/signup_login/components/signup_fragment.dart';

class SignupLoginViewModel extends ChangeNotifier {
  /// It makes sure that user can only click on "Dont have an account? Sign Up" and "Login" that are at the very
  /// end of the fragment when the user is actually not logging in and signing up
  late bool _canGoToSignUpOrLogin;

  bool get canGoToSignUpOrLogin => _canGoToSignUpOrLogin;

  set canGoToSignUpOrLogin(v) {
    _canGoToSignUpOrLogin = v;
    notifyListeners();
  }

  SignupLoginViewModel() {
    _canGoToSignUpOrLogin = true;
  }

  Future loginUser(LoginData loginData) async {
    _canGoToSignUpOrLogin = false;
    // DO THINGS HERE
    _canGoToSignUpOrLogin = true;
  }

  Future signUpUser(SignUpData signUpData) async {
    _canGoToSignUpOrLogin = false;
    // DO THINGS HERE
    _canGoToSignUpOrLogin = true;
  }
}
