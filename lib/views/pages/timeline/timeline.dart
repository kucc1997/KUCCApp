import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'components/timeline_block.dart';
const events_data = [
  {
    "month": "November",
    "year": "2022",
    "events": [
      {
        "date": "17",
        "title": "3D Animation Workshop",
        "location": "304",
        "time": "11:00 AM",
        "category": "Graphic",
        "people": "15",
        "day": "Tue"
      },
      {
        "date": "23",
        "title": "Python for Beginners",
        "location": "302",
        "time": "11:00 AM",
        "category": "Python",
        "people": "15",
        "day": "Fri"
      },
      {
        "date": "27",
        "title": "Introduction to Figma",
        "location": "305",
        "time": "11:00 AM",
        "category": "Design",
        "people": "17",
        "day": "Sun"
      },
    ]
  },
  {
    "month": "December",
    "year": "2022",
    "events": [
      {
        "date": "2",
        "title": "Design Thinking Workshop",
        "location": "304",
        "time": "11:00 AM",
        "category": "Design",
        "people": "15",
        "day": "Mon"
      },
      {
        "date": "11",
        "title": "App Development with Flutter",
        "location": "204",
        "time": "18:00 PM",
        "category": "Flutter",
        "people": "23",
        "day": "Mon"
      },
      {
        "date": "19",
        "title": "Introduction to Figma",
        "location": "305",
        "time": "11:00 AM",
        "category": "Design",
        "people": "17",
        "day": "Sun"
      },
      {
        "date": "25",
        "title": "HTML & CSS for Beginners",
        "location": "204",
        "time": "18:00 PM",
        "category": "Code",
        "people": "10",
        "day": "Wed"
      },
    ]
  }
];

class TimeLinePage extends HookWidget {
  const TimeLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 230, 247),
        body: ListView.builder(
            itemCount: events_data.length,
            itemBuilder: ((context, index) {
              return TimeLineBlock(
                  year: events_data[index]["year"].toString(),
                  month: events_data[index]["month"].toString(),
                  events: events_data[index]["events"]);
            })));
  }
}