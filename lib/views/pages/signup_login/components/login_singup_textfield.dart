import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

/// A L(Login)S(SignUp)TextField
class LSTextField extends HookWidget {
  final String? label;
  final String placeholder;

  const LSTextField({super.key, this.label, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        label != null
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  style: GoogleFonts.manrope(textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                  label!,
                ))
            : const SizedBox.shrink(), // Replace with something whose size is 0
        Container(
          padding: const EdgeInsets.only(top: 4),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF394078)),
                ),
                hintText: placeholder,
                hintStyle: GoogleFonts.manrope(textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                contentPadding: const EdgeInsets.all(12)),
          ),
        ),
      ],
    );
  }
}
