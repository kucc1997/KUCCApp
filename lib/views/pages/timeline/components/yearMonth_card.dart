import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class YearMonth extends StatelessWidget {
  final int year;
  final int month;

  const YearMonth({super.key, required this.year, required this.month});

  @override
  Widget build(BuildContext context) {
    String _month = DateFormat.MMMM().format(DateTime(2023, month, 1));
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 8, 8),
      child: Text(
        "$_month $year",
        style: GoogleFonts.inter(
            textStyle:
                const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
