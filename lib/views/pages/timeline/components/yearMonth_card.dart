import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearMonth extends StatelessWidget {
  final String year;
  final String month;

  const YearMonth({super.key, required this.year, required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(23, 12, 8, 8),
      child: Text(
        "$month $year",
        style: GoogleFonts.inter(
              textStyle:TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
