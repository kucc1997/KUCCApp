/// A single event on the timeline
class TimeLineEventData implements Comparable<TimeLineEventData> {
  late final DateTime dateTime; // In YYYY-MM-DD:HH:MM (Eg. 2023-10-30 15:45:00)
  late final String title; // The title of the event
  late final String location; // The location (Eg. Virtual, Block 9 - 304)
  late final List<String> categories; // Categories such as ["Flutter", "Dart"]
  late final int noOfPeople; // The current no of registrants

  TimeLineEventData.fromJSON(Map<String, dynamic> json) {
    dateTime = DateTime.parse(json["date"]);
    title = json["title"];
    location = json["location"];
    categories = json["categories"];
    noOfPeople = json["noOfPeople"];
  }

  int get eventYear {
    return dateTime.year;
  }

  int get eventMonth {
    return dateTime.month;
  }

  int get eventDay {
    return dateTime.day;
  }

  @override
  int compareTo(TimeLineEventData other) {
    return dateTime.compareTo(other.dateTime);
  }
}
