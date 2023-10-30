import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kucc_app/models/model/timeline_event_data.dart';

import 'components/timeline_block.dart';

const events_data = [
  {
    "date": "2023-10-30 15:45:00",
    "title": "HTML & CSS for Beginners",
    "location": "204",
    "categories": ["Code"],
    "noOfPeople": 10,
    "day": "Wed"
  },
  {
    "date": "2022-09-11 15:45:00",
    "title": "HTML & CSS for Beginners",
    "location": "204",
    "categories": ["Code"],
    "noOfPeople": 10,
    "day": "Wed"
  },
];

class TimeLine extends HookWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    final events = useState<Map<int, Map<int, List<TimeLineEventData>>>>({});

    useEffect(() {
      // fetch the data from here
      events_data.forEach((d) {
        debugPrint("ABOUT TO ADD $d");
        TimeLineEventData event = TimeLineEventData.fromJSON(d);

        int eventYear = event.eventYear;
        int eventMonth = event.eventMonth;

        if (events.value.containsKey(eventYear)) {
          // if an eventMonth of the eventYear is already in the map, then we add on to
          // the list it holds else we create a fresh list and add
          if (events.value[eventYear]!.containsKey(eventMonth)) {
            events.value[eventYear]![eventMonth]!.add(event);
          } else {
            events.value[event.eventYear] = {
              event.eventMonth: [event]
            };
          }
        } else {
          // directly adding as there's no any event of this year, so adding a fresh one
          events.value[event.eventYear] = {
            event.eventMonth: [event]
          };
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xFFE2E4F3),
      body: SingleChildScrollView(
        child: Column(
            children: (events.value.keys.toList()..sort())
                .map((eventYear) {
                  return (events.value[eventYear]!.keys.toList()..sort())
                      .map((eventMonth) {
                    return TimeLineOfMonth(
                      year: eventYear,
                      month: eventMonth,
                      events: events.value[eventYear]![eventMonth]!,
                    );
                  });
                })
                .expand((e) => e)
                .toList()),
      ),
    );
  }
}

