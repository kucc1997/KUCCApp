import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timelines/timelines.dart';
import 'workshop_card.dart';

class TimeLineTiles extends HookWidget {
  final bool isFirst;
  final String category;
  final String time;
  final String workshopName;
  final String room;
  final String date;
  final String noOfPeople;
  final String day;

  const TimeLineTiles(
      {super.key,
      required this.isFirst,
      required this.category,
      required this.time,
      required this.workshopName,
      required this.room,
      required this.date,
      required this.noOfPeople,
      required this.day});

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      builder: TimelineTileBuilder.fromStyle(
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text('Timeline Event $index'),
        ),
        itemCount: 1,
      ),
    );
    //return TimelineTile(
    //    alignment: TimelineAlign.manual,
    //    lineXY: 0.15,
    //    startChild: DayDateCard(day: day, date: date),
    //    isFirst: isFirst,
    //    isLast: false,
    //    indicatorStyle: const IndicatorStyle(
    //      width: 8,
    //    ),
    //    beforeLineStyle: const LineStyle(thickness: 1),
    //    endChild: Column(
    //      children: [
    //        WorkshopCard(
    //            category: category,
    //            time: time,
    //            workshopName: workshopName,
    //            room: room,
    //            noOfPeople: noOfPeople),
    //      ],
    //    ));
  }
}
