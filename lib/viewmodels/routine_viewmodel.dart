import 'package:flutter/material.dart';
import 'package:kucc_app/models/model/routine_data.dart';

var routine = {
  "batch": "2021",
  "faculty": "CS",
  "schedule": {
    "Sun": [
      {"subject": "ABC 202", "startTime": 7, "endTime": 9},
      {"subject": "MATH 101", "startTime": 9, "endTime": 11},
      {"subject": "EDRG 101", "startTime": 11, "endTime": 12},
    ],
    "Mon": [
      {"subject": "ABC 202", "startTime": 7, "endTime": 9},
      {"subject": "MATH 101", "startTime": 9, "endTime": 10},
      {"subject": "Break", "startTime": 10, "endTime": 11},
      {"subject": "EDRG 101", "startTime": 11, "endTime": 13},
    ],
    "Tue": [
      {"subject": "ABC 202", "startTime": 7, "endTime": 9},
      {"subject": "MATH 101", "startTime": 9, "endTime": 10},
      {"subject": "Break", "startTime": 10, "endTime": 11},
      {"subject": "EDRG 101", "startTime": 11, "endTime": 13},
    ],
    "Wed": [
      {"subject": "ABC 202", "startTime": 7, "endTime": 9},
      {"subject": "MATH 101", "startTime": 9, "endTime": 10},
      {"subject": "Break", "startTime": 10, "endTime": 11},
      {"subject": "EDRG 101", "startTime": 11, "endTime": 13},
    ],
    "Thu": [
      {"subject": "PHY 202", "startTime": 7, "endTime": 9},
      {"subject": "MATH 101", "startTime": 9, "endTime": 10},
      {"subject": "Break", "startTime": 10, "endTime": 11},
      {"subject": "EDRG 101", "startTime": 11, "endTime": 13},
    ],
    "Fri": [
      {"subject": "PHY 202", "startTime": 7, "endTime": 9},
      {"subject": "MATH 101", "startTime": 9, "endTime": 10},
      {"subject": "Break", "startTime": 10, "endTime": 11},
      {"subject": "EDRG 101", "startTime": 11, "endTime": 13},
    ],
  }
};

class RoutineViewModel extends ChangeNotifier {
  static List<String> allDaysInAWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  late RoutineData currentRoutine;
  late String _currentWeekDay;

  RoutineViewModel() {
    DateTime now = DateTime.now();
    int weekDay = now.weekday;
    _currentWeekDay = allDaysInAWeek[weekDay];

    currentRoutine = RoutineData.fromJSON(routine);
  }

  /// The start time of the currently selected week day
  int get currentWeekDayStartTime => currentRoutine.dayStartTime(_currentWeekDay);

  /// The end time of the currently selected week day
  int get currentWeekDayEndTime => currentRoutine.dayEndTime(_currentWeekDay);

  List<DaySchedule> get currentWeekDaySchedule {
    var v = currentRoutine.schedule[_currentWeekDay]!;
    v.sort(
        (dayScheduleA, dayScheduleB) => dayScheduleA.startTime.compareTo(dayScheduleB.startTime));
    return v;
  }

  /// The currently selected week whose routine we want to view
  String get currentWeekDay => _currentWeekDay;

  set currentWeekDay(String weekDay) {
    _currentWeekDay = weekDay;
    notifyListeners();
  }

  Future<RoutineData?> getRoutine() async {}
}
