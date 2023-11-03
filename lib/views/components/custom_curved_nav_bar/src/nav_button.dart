/// `nav_button.dart`
///
/// This file defines a NavButton widget for a Flutter application.
///
/// The NavButton is a custom widget that represents a single navigation option
/// in a navigation bar.
/// It takes in several parameters including the current position, total length
/// of the navigation bar, index of the button, onTap function, and the child widget.
///
/// The `build` method defines the appearance and behavior of the NavButton. It
/// calculates the desired position of the button and the difference from the current
/// position to animate the button's vertical alignment and opacity.
/// The GestureDetector widget is used to handle tap events, triggering the
/// provided onTap function with the index of the button.

import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;

  NavButton({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Container(
            height: 75.0,
            child: Transform.translate(
              offset: Offset(
                  0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: child),
            )),
      ),
    );
  }
}
