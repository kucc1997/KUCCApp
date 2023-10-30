import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'timeline_tile.dart';
import 'yearMonth_card.dart';


class TimeLineBlock extends HookWidget {
  final String year;
  final String month;
  final events;
  TimeLineBlock(
      {super.key,
      required this.year,
      required this.month,
      required this.events});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YearMonth(year: year, month: month),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: events.length,
                itemBuilder: ((context, index) {
                  return index == 0
                      ? TimeLineTiles(
                          isFirst: true,
                          category: events[index]["category"],
                          time: events[index]["time"],
                          workshopName: events[index]["title"],
                          room: events[index]["location"],
                          date: events[index]["date"],
                          PeopleNo: events[index]["people"],
                          day: events[index]["day"])
                      : TimeLineTiles(
                          isFirst: false,
                          category: events[index]["category"],
                          time: events[index]["time"],
                          workshopName: events[index]["title"],
                          room: events[index]["location"],
                          date: events[index]["date"],
                          PeopleNo: events[index]["people"],
                          day: events[index]["day"]);
                }))
          ],
        ));
  }
}
