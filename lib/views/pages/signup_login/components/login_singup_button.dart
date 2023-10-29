import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Button used in login and signup
class LSButton extends HookWidget {
  final Widget child;
  final void Function()? onTap;
  final bool isEnabled;

  const LSButton({super.key, required this.child, required this.onTap, required this.isEnabled});

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
          onTap: isEnabled ? onTap : null,
          child: Container(
            padding: const EdgeInsets.all(16.0), // Add padding as needed
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
