import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailChip extends HookWidget {
  final IconData? startingIcon;
  final String information;

  const DetailChip({super.key, this.startingIcon, required this.information});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.8),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
        child: Chip(
          backgroundColor: Colors.white,
          avatar: startingIcon != null
              ? Icon(
                  startingIcon,
                  color: Colors.grey,
                  size: 15,
                )
              : null,
          label: Text(
            information,
            style: GoogleFonts.inter(fontSize: 13, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
