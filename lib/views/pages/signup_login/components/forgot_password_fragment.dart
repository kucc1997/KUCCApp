import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_button.dart';
import 'package:kucc_app/views/pages/signup_login/components/login_singup_textfield.dart';

class ForgotPasswordFragment extends HookWidget {
  final void Function() onSignUpClick;
  final void Function() onWantToLoginClick;

  const ForgotPasswordFragment({super.key, required this.onSignUpClick, required this.onWantToLoginClick});

  @override
  Widget build(BuildContext context) {
    final progressValue = useState(0.25);
    final tabController = useTabController(initialLength: 3);

    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 18)),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Color(0xFF979797), width: 1), borderRadius: BorderRadius.circular(8)),
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF1D7000),
            backgroundColor: Colors.transparent,
            value: progressValue.value,
            minHeight: 8,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              RegisteredEmailForgotPasswordSubFragment(),
              OTPVerificationForgotPasswordSubFragment(),
              const Text("xyz"),
              const Text("mma"),
            ],
          ),
        ),
      ],
    );
  }
}

class RegisteredEmailForgotPasswordSubFragment extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Text("lajdf");
  }
}

class OTPVerificationForgotPasswordSubFragment extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Text("lajdf");
  }
}
