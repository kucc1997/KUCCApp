import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeBox extends HookWidget {
  final String time;

  TimeBox({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time,
          color: Colors.grey,
          size: 14,
        ),
        SizedBox(width: 3),
        Text(time,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            )),
      ],
    );
  }
}
