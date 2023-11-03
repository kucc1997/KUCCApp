/// `exporting_nav.dart`
///
/// This file defines a CustomNavBar widget for a Flutter application.
///
/// The CustomNavBar is a custom widget that wraps the CurvedNavBar widget and provides additional customization options.
/// It takes in several parameters including a navigation shell, labels for the navigation options, and icons for the navigation options.
///
/// The `build` method in the `_CustomNavBarState` class defines the appearance and behavior of the CustomNavBar.
///
/// The `navigationShell` is a required parameter of type `StatefulNavigationShell` which likely handles the state and behavior of the navigation.
/// The `labels` are optional parameters that define the labels and icons of the navigation options respectively.

import '../custom_curved_nav_bar/src/curved_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    required this.navigationShell,
    super.key,
    this.labels,
    required this.icons,
  });
  final StatefulNavigationShell navigationShell;
  final List<String>? labels;
  final List<Widget> icons;
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    Key? bottomNavigationKey;
    return (CurvedNavigationBar(
      labels: widget.labels,
      key: bottomNavigationKey,
      index: widget.navigationShell.currentIndex,
      height: 75.0,
      items: widget.icons,
      color: Colors.white,
      buttonBackgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOutCubicEmphasized,
      animationDuration: const Duration(milliseconds: 400),
      onTap: (index) {
        setState(() {
          //change the page according to index
          _onTap(context, index);
        });
      },
      letIndexChange: (index) => true,
    ));
  }

  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
