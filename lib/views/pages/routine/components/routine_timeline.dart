import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/viewmodels/routine_viewmodel.dart';
import 'package:kucc_app/views/pages/routine/routine.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

class RoutineTimeline extends HookWidget {
  final double oneHourHeight;
  final double indicatorWidthCoveragePerc;

  const RoutineTimeline(
      {super.key, this.oneHourHeight = 96, this.indicatorWidthCoveragePerc = 0.18});

  @override
  Widget build(BuildContext context) {
    RoutineViewModel rVM = Provider.of(context);
    final currentWeekDaySchedule = rVM.currentWeekDaySchedule;
    final startTime = rVM.currentWeekDayStartTime;
    return SizedBox(
      height: (rVM.currentWeekDayEndTime - rVM.currentWeekDayStartTime + 1) * oneHourHeight,
      child: Stack(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (rVM.currentWeekDayEndTime - rVM.currentWeekDayStartTime) + 1,
            itemBuilder: (x, i) {
              return TimelineTile(
                nodePosition: indicatorWidthCoveragePerc,
                oppositeContents: Transform.translate(
                  offset: const Offset(0, -6),
                  child: SizedBox(
                    height: oneHourHeight,
                    width: 48,
                    child: Text(
                      "${startTime + i} ${(startTime + i) > 12 ? "pm" : "am"}",
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF919191),
                      ),
                    ),
                  ),
                ),
                node: const TimelineNode(
                  indicatorPosition: 0.0,
                  indicator: DotIndicator(
                    size: 8,
                    color: Color(0xFF919191),
                  ),
                  startConnector: SolidLineConnector(
                    color: Color(0xFF919191),
                  ),
                  endConnector: SolidLineConnector(
                    color: Color(0xFF919191),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: (indicatorWidthCoveragePerc * MediaQuery.of(context).size.width),
            child: SizedBox(
              width: ((1 - indicatorWidthCoveragePerc) * MediaQuery.of(context).size.width),
              child: Column(
                  children: currentWeekDaySchedule.map((subjectSchedule) {
                return RoutineSubjectCard(
                  singleHourHeight: oneHourHeight,
                  startTime: subjectSchedule.startTime,
                  endTime: subjectSchedule.endTime,
                  subject: subjectSchedule.subject,
                );
              }).toList()),
            ),
          )
        ],
      ),
    );
  }
}

class RoutineSubjectCard extends StatelessWidget {
  final double singleHourHeight;
  final String subject;
  final int startTime;
  final int endTime;

  const RoutineSubjectCard(
      {super.key,
      required this.singleHourHeight,
      required this.subject,
      required this.startTime,
      required this.endTime});

  @override
  Widget build(BuildContext context) {
    int hours = endTime - startTime;

    String amORpm(int time) {
      return time > 12 ? "PM" : "AM";
    }

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Container(
        height: (singleHourHeight * hours) - 8,
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xFF72C0D1),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: GoogleFonts.manrope(
                    fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$hours hour",
                    style: GoogleFonts.manrope(
                        fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                  Text(
                    "$startTime:00${amORpm(startTime)} - $endTime:00${amORpm(endTime)}",
                    style: GoogleFonts.manrope(
                        fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
