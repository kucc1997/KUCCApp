import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class DayDateCard extends HookWidget {
  final String day;
  final String date;

  const DayDateCard({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        children: [
          Text(
            date,
            style: GoogleFonts.inter(
              textStyle:TextStyle(
                fontWeight: FontWeight.w700, fontSize: 19, color: Colors.grey),
          ),),
          Text(
            day,
            style: GoogleFonts.inter(
              textStyle:TextStyle(fontSize: 12.5, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
