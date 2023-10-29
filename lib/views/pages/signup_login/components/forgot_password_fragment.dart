import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF979797), width: 1), borderRadius: BorderRadius.circular(8)),
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
              OTPVerificationForgotPasswordSubFragment(),
              RegisteredEmailForgotPasswordSubFragment(),
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
    final registeredEmail = useState("");

    return Column(children: [
      const Padding(padding: EdgeInsets.only(top: 28)),
      Text("Forgot Password",
          style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
      const Padding(padding: EdgeInsets.only(top: 4)),
      Text("Don't worry! it happens",
          style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      Text("We'll send you an OTP in this email",
          style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      const Padding(padding: EdgeInsets.only(top: 28)),
      LSTextField(
        onChanged: (v) => registeredEmail.value = v,
        placeholder: "Enter your registered email",
      ),
      const Padding(padding: EdgeInsets.only(top: 18)),
      LSButton(
        isEnabled: true,
        onTap: () {},
        child: const Text(
          "Continue",
          style: TextStyle(color: Colors.white),
        ),
      )
    ]);
  }
}

class OTPVerificationForgotPasswordSubFragment extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(padding: EdgeInsets.only(top: 28)),
      Text("OTP Verification",
          style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
      const Padding(padding: EdgeInsets.only(top: 4)),
      Text("Please enter for digit OTP we sent to",
          style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      Text("r******1@gmail.com",
          style: GoogleFonts.manrope(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      const Padding(padding: EdgeInsets.only(top: 28)),
      //LSTextField(
      //  onChanged: (v) => registeredEmail.value = v,
      //  placeholder: "Enter your registered email",
      //),
      //const Padding(padding: EdgeInsets.only(top: 18)),
      //LSButton(
      //  onTap: () {},
      //  child: const Text(
      //    "Continue",
      //    style: TextStyle(color: Colors.white),
      //  ),
      //)
    ]);
  }
}
