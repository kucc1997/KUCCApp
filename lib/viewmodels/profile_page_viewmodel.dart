import 'package:flutter/material.dart';

class ProfilePageViewModel extends ChangeNotifier {
  ProfilePageViewModel();

  String _userName = 'John Doe';

  String get userName => _userName;

  void updateUserName(String newName) {
    _userName = newName;
    notifyListeners(); // Notify listeners about the change
  }
}
