import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'daydate_card.dart';
import 'workshop_card.dart';

class TimeLineTiles extends HookWidget {
  final bool isFirst;
  final String category;
  final String time;
  final String workshopName;
  final String room;
  final String date;
  final String PeopleNo;
  final String day;

  TimeLineTiles(
      {super.key,
      required this.isFirst,
      required this.category,
      required this.time,
      required this.workshopName,
      required this.room,
      required this.date,
      required this.PeopleNo,
      required this.day});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.15,
      startChild: DayDateCard(day: day, date: date),
      isFirst: isFirst,
      isLast: false,
      indicatorStyle: const IndicatorStyle(
        width: 7,
      ),
      beforeLineStyle: const LineStyle(thickness: 1),
      endChild: WorkshopCard(
          category: category,
          time: time,
          workshopName: workshopName,
          room: room,
          PeopleNo: PeopleNo),
    );
  }
}
