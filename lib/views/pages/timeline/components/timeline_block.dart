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

  const TimeLineOfMonth({super.key, required this.month, required this.events, required this.year});

  @override
  Widget build(BuildContext context) {
    // day mapped to the list of events for that day
    var dayEvents = useState<Map<int, List<TimeLineEventData>>>({});

    useEffect(() {
      for (var i = 0; i < events.length; i++) {
        if (dayEvents.value[events[i].eventDay] == null) {
          dayEvents.value[events[i].eventDay] = List.from([events[i]], growable: true);
        } else {
          dayEvents.value[events[i].eventDay]!.add(events[i]);
        }
      }
      return null;
    }, []);

    return Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YearMonth(year: year, month: month),
            const Padding(padding: EdgeInsets.only(top: 12)),
            Column(
                children: (dayEvents.value.keys.toList()..sort()).map((day) {
              DateTime dateTime = dayEvents.value[day]!.first.dateTime;
              return FixedTimeline.tileBuilder(
                theme: TimelineThemeData.vertical().copyWith(
                    nodePosition: 0.08, connectorTheme: const ConnectorThemeData(thickness: 2.8)),
                builder: TimelineTileBuilder(
                  indicatorBuilder: (_, index) => DateAndDot(
                    dateTime: dateTime,
                  ),
                  indicatorPositionBuilder: (_, index) => 0,
                  startConnectorBuilder: (_, index) => const IndicatorConnector(),
                  endConnectorBuilder: (_, index) => const IndicatorConnector(),
                  contentsAlign: ContentsAlign.basic,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 8, top: 18),
                    child: Column(
                        children: (dayEvents.value[day]!..sort()).map((event) {
                      return WorkshopCard(
                          workshopName: event.title,
                          dateTime: event.dateTime,
                          category: event.categories.first,
                          location: event.location,
                          noOfPeople: event.noOfPeople);
                    }).toList()),
                  ),
                  itemCount: 1,
                ),
              );
            }).toList())
          ],
        ));
  }
}

class IndicatorConnector extends StatelessWidget {
  const IndicatorConnector({super.key});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: Connector.solidLine(
        color: Colors.black,
      ),
    );
  }
}
