import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kucc_app/views/components/custom_curved_nav_bar/exporting_nav.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  @override
  Widget build(BuildContext context) {
    const labels = ['Events', 'Home', 'Profile'];
    const icons = <Widget>[
      /// *[Icon]* are later modified in the [CurvedNavigationBar] class
      /// Attention: While using other packages for icons, make sure
      /// not to pass any other type of [Widget] other than [Icon] to
      /// the [CurvedNavigationBar] class.
      Icon(Icons.date_range_rounded, size: 30, color: Color(0xFF394078)),
      Icon(CupertinoIcons.home, size: 28, color: Color(0xFF394078)),
      Icon(Icons.person_outline, size: 30, color: Color(0xFF394078)),
    ];
    return Scaffold(
      body: Stack(
        children: [
          widget.navigationShell,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomNavBar(
              navigationShell: widget.navigationShell,
              labels: labels,
              icons: icons,
            ),
          ),
        ],
      ),
    );
  }
  // return Scaffold(
  //   body: widget.navigationShell,
  //   bottomNavigationBar: CustomNavBar(
  //     navigationShell: widget.navigationShell,
  //     labels: labels,
  //     icons: icons,
  //   ),
  // );
}
