import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignupLogin extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // change with theme
      body: Center(
        child: LoginContent(),
      ),
    );
  }
}

class LoginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 66),
      alignment: Alignment.center,
      width: 300,
      child: Column(
        children: [
          LogoWidget(),
          const Text(
            "Hi, Welcome Back!👋",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          LoginTextField(
            label: "Email",
            placeholder: "example@gmail.com",
          ),
          LoginTextField(
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
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: 133,
      child: Image.asset("assets/images/kucc_logo.png"),
    );
  }
}

class LoginTextField extends HookWidget {
  final String label;
  final String placeholder;

  LoginTextField({required this.label, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              label,
            )),
        Container(
          padding: const EdgeInsets.only(top: 4),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
              hintText: placeholder,
            ),
          ),
        ),
      ],
    );
  }
}

/// Button used in login and signup
class LSButton extends HookWidget {
  final Widget child;
  final void Function()? onTap;

  LSButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF394078),
        borderRadius: BorderRadius.circular(10.0), // Set the border radius
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16.0), // Add padding as needed
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
