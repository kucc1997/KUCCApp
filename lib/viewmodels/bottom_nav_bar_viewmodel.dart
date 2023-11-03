import 'package:flutter/material.dart';

class BottomNavBarViewModel extends ChangeNotifier {
  late bool _displayBottomNavBar;

  bool get displayBottomNavBar => _displayBottomNavBar;
  set displayBottomNavBar(v) {
    _displayBottomNavBar = v;
    notifyListeners();
  }

  BottomNavBarViewModel() {
    _displayBottomNavBar = true;
  }
}
