import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class DateAndDot extends StatelessWidget {
  final DateTime dateTime;

  const DateAndDot({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    const double dotHeighOrWidth = 18;

    return SizedBox(
      height: dotHeighOrWidth,
      width: dotHeighOrWidth,
      child: Stack(children: [
        Indicator.dot(size: 8, color: Colors.grey),
        OverflowBox(
          maxHeight: 38,
          maxWidth: 100,
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(
              right: 48,
            ),
            child: Opacity(
                opacity: 0.33,
                child: StackedDayAndDayOfWeek(dateTime: dateTime)),
          ),
        ),
      ]),
    );
  }
}

class StackedDayAndDayOfWeek extends StatelessWidget {
  final DateTime dateTime;

  const StackedDayAndDayOfWeek({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    String day = dateTime.day.toString();
    String dayOfWeek = DateFormat.E().format(dateTime);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          day,
          style: GoogleFonts.inter(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
        ),
        Text(
          dayOfWeek,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
