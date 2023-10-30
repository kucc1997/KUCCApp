import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kucc_app/models/model/timeline_event_data.dart';
import 'package:kucc_app/views/pages/timeline/components/date_and_dot.dart';
import 'package:kucc_app/views/pages/timeline/components/workshop_card.dart';
import 'package:timelines/timelines.dart';
import 'yearMonth_card.dart';

class TimeLineOfMonth extends HookWidget {
  final int month;
  final int year;
  final List<TimeLineEventData> events;

  const TimeLineOfMonth(
      {super.key,
      required this.month,
      required this.events,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YearMonth(
                year: year.toString(),
                month: DateFormat.MMMM().format(DateTime(2023, month, 1))),
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: FixedTimeline.tileBuilder(
                theme: TimelineThemeData.vertical().copyWith(
                    nodePosition: 0.1,
                    indicatorTheme: const IndicatorThemeData(
                        position: 0.5, color: Colors.red),
                    connectorTheme: const ConnectorThemeData(thickness: 2.8)),
                builder: TimelineTileBuilder(
                  indicatorBuilder: (_, index) => DateAndDot(
                    dateTime: DateTime.now(),
                  ),
                  indicatorPositionBuilder: (_, index) => 0,
                  startConnectorBuilder: (_, index) => Opacity(
                    opacity: 0.2,
                    child: Connector.solidLine(
                      color: Colors.black,
                    ),
                  ),
                  endConnectorBuilder: (_, index) => Opacity(
                    opacity: 0.2,
                    child: Connector.solidLine(
                      color: Colors.black,
                    ),
                  ),
                  contentsAlign: ContentsAlign.basic,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 18, bottom: 12, top: 16),
                    child: Column(children: [
                      //WorkshopCard(
                      //category: "afdsa",
                      //time: "asdfajj",
                      //workshopName: "asdfj",
                      //room: "asfd",
                      //noOfPeople: "10"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                      Text("lajdfljsaj"),
                    ]),
                  ),
                  itemCount: 4,
                ),
              ),
            )

            //ListView.builder(
            //    shrinkWrap: true,
            //    physics: const NeverScrollableScrollPhysics(),
            //    itemCount: events.length,
            //    itemBuilder: ((context, index) {
            //      return TimeLineTiles(
            //          isFirst: index == 0,
            //          category: events[index]["category"],
            //          time: events[index]["time"],
            //          workshopName: events[index]["title"],
            //          room: events[index]["location"],
            //          date: events[index]["date"],
            //          noOfPeople: events[index]["people"],
            //          day: events[index]["day"]);
            //    }))
          ],
        ));
  }
}
