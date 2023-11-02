//ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kucc_app/models/model/timeline_event_data.dart';
import 'package:kucc_app/viewmodels/timeline_viewmodel.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:provider/provider.dart';

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
    "date": "2023-10-30 15:45:00",
    "title": "Data in hand",
    "location": "204",
    "categories": ["Code"],
    "noOfPeople": 20,
    "day": "Wed"
  },
  {
    "date": "2023-10-30 15:45:00",
    "title": "Data in stomach",
    "location": "204",
    "categories": ["Code"],
    "noOfPeople": 30,
    "day": "Wed"
  },
  {
    "date": "2022-09-28 15:45:00",
    "title": "HTML & CSS for Beginners and aldfjals flas fals and lets do this   ",
    "location": "204",
    "categories": ["Code"],
    "noOfPeople": 10,
    "day": "Wed"
  },
  {
    "date": "2023-06-28 15:45:00",
    "title": "HTML & CSS for Beginners",
    "location": "204",
    "categories": ["Code"],
    "noOfPeople": 10,
    "day": "Wed"
  },
  {
    "date": "2023-06-27 15:45:00",
    "title": "Atom Bom Materials Needed Course",
    "location": "204",
    "categories": ["Code"],
    "noOfPeople": 10,
    "day": "Wed"
  },
  {
    "date": "2023-06-28 15:45:00",
    "title": "Atom Bomb Course",
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
    final tlvm = Provider.of<TimeLineViewModel>(context);

    //void fetchEvents() async {}

    useEffect(() {
      // fetch the data here events_data lai hatayera put on downloaded data
      events_data.map((d) => TimeLineEventData.fromJSON(d)).forEach((event) {
        int eventYear = event.eventYear;
        int eventMonth = event.eventMonth;

        if (events.value[eventYear] != null) {
          if (events.value[eventYear]![eventMonth] != null) {
            events.value[eventYear]![eventMonth]?.add(event);
          } else {
            events.value[eventYear]![eventMonth] = List.from([event], growable: true);
          }
        } else {
          events.value[eventYear] = {
            eventMonth: List.from([event], growable: true)
          };
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: const Color(0xFFE2E4F3),
      body: Column(
        children: [
          KUCCAppBar(),
          Expanded(
            child: RefreshIndicator(
              displacement: 24,
              onRefresh: () async {},
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView(
                    children: (events.value.keys.toList()..sort())
                        .map((eventYear) {
                          return (events.value[eventYear]!.keys.toList()..sort()).map((eventMonth) {
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
            ),
          ),
        ],
      ),
    );
  }
}
