// TODO : Use color from the themeprovider

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutineFacultyBatchDropDown extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          onTap: () {
            //showDropDown();
          },
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Choose your faculty",
                    style: GoogleFonts.manrope(fontWeight: FontWeight.w500, fontSize: 16)),
                const Icon(Icons.keyboard_arrow_down, size: 28),
              ],
            ),
          )),
    );
  }
}
