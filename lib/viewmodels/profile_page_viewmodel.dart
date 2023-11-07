import 'package:flutter/material.dart';

class ProfilePageViewModel extends ChangeNotifier {
  ProfilePageViewModel();

  String _userName = 'John Doe';
  String _fieldofStudy = "Computer Engineering";
  String _academicYear = "2";
  String _academicSemester = "1";

  String get userName => _userName;
  String get fieldofStudy => _fieldofStudy;
  String get academicYear => _academicYear;
  String get academicSemester => _academicSemester;

  void updateUserName(String newName) {
    _userName = newName;
    notifyListeners(); // Notify listeners about the change
  }
}
