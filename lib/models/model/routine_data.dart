class RoutineData {
  late String batch;
  late String faculty;
  late Map<String, List<DaySchedule>> schedule;

  RoutineData.fromJSON(Map<dynamic, dynamic> json) {
    batch = json["batch"];
    faculty = json["faculty"];
    schedule = <String, List<DaySchedule>>{};

    json["schedule"].forEach((k, v) {
      List<DaySchedule> weekSchedule = List.empty(growable: true);
      v.forEach((d) {
        weekSchedule.add(DaySchedule.fromJSON(d));
      });
      schedule[k] = weekSchedule;
    });
  }

  /// The time in hour where the day starts
  int dayStartTime(String weekDay) {
    int dayStartTime = 23;
    for (DaySchedule schedule in schedule[weekDay]!) {
      if (schedule.startTime < dayStartTime) {
        dayStartTime = schedule.startTime;
      }
    }
    return dayStartTime;
  }

  /// The time in hour where the day ends
  /// If the dayEndTime is 13 then it means that the
  /// routine is upto 1 o' or 13 o' clock only
  int dayEndTime(String weekDay) {
    int dayEndTime = 1;
    for (DaySchedule schedule in schedule[weekDay]!) {
      if (schedule.endTime > dayEndTime) {
        dayEndTime = schedule.endTime;
      }
    }
    return dayEndTime;
  }
}

class DaySchedule {
  /// The subject of the routine
  late String subject;

  /// Start time of the subject in hour, in 13..14..15. format
  late int startTime;

  /// End time of the subject in hour, in 13..14..15. format
  late int endTime;

  /// No of hours taken by the subject
  int get hours => endTime - startTime;

  DaySchedule.fromJSON(Map<dynamic, dynamic> json) {
    subject = json["subject"];
    startTime = json["startTime"];
    endTime = json["endTime"];
  }
}
