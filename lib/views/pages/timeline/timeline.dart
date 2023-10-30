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
];

class TimeLine extends HookWidget {
  const TimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    final events = useState([]);

    useEffect(() {
      // Fetch all the events here
      events.value =
          events_data.map((v) => TimeLineEventData.fromJSON(v)).toList();
    }, []);

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 230, 247),
        body: ListView.builder(
            itemCount: events_data.length,
            itemBuilder: ((context, index) {
              //   return TimeLineBlock(
              //       year: events_data[index]["year"].toString(),
              //       month: events_data[index]["month"].toString(),
              //       events: events_data[index]["events"]);
              return Text("alfjdslaj");
            })));
  }
}

