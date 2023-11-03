import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/models/model/routine_data.dart';
import 'package:kucc_app/viewmodels/routine_viewmodel.dart';
import 'package:provider/provider.dart';

class RoutlineWeekSliderCard extends HookWidget {
  final String weekDay;
  final bool isSelected;
  final Function(String) onClick;
  final int hours;

  const RoutlineWeekSliderCard(
      {super.key,
      required this.weekDay,
      required this.isSelected,
      required this.onClick,
      required this.hours});

  @override
  Widget build(BuildContext context) {
    Color primaryColor, textColor;
    if (isSelected) {
      textColor = Colors.white;
      primaryColor = const Color(0xFF394078);
    } else {
      primaryColor = Colors.white;
      textColor = const Color(0xFF394078);
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          onClick(weekDay);
        },
        child: Ink(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Container(
            alignment: Alignment.center,
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weekDay,
                  style: GoogleFonts.manrope(
                      fontSize: 18,
                      textStyle: TextStyle(color: textColor),
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Hours : $hours",
                  style: GoogleFonts.manrope(
                      fontSize: 12,
                      textStyle: TextStyle(color: textColor),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A Slider to select a day of the week.
class RoutineWeekSlider extends HookWidget {
  const RoutineWeekSlider({super.key});

  @override
  Widget build(BuildContext context) {
    RoutineViewModel rVM = Provider.of(context);
    final allDaysInAWeek = RoutineViewModel.allDaysInAWeek;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...allDaysInAWeek.map((weekDay) {
            int hours =
                rVM.currentRoutine.dayEndTime(weekDay) - rVM.currentRoutine.dayStartTime(weekDay);
            return Container(
              width: 92, // Adjust the width as needed
              height: 72, // Adjust the height as needed
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              alignment: Alignment.center,
              child: RoutlineWeekSliderCard(
                hours: hours,
                weekDay: weekDay,
                onClick: (selectedWeekDay) {
                  rVM.currentWeekDay = selectedWeekDay;
                },
                isSelected: rVM.currentWeekDay == weekDay,
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
