import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:kucc_app/viewmodels/bottom_nav_bar_viewmodel.dart';
import 'package:kucc_app/views/components/custom_curved_nav_bar/exporting_nav.dart';
import 'package:provider/provider.dart';

class ScaffoldWithBottomNavBar extends HookWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithBottomNavBar({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithBottomNavBar'));

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(milliseconds: 180));
    final bnbVM = Provider.of<BottomNavBarViewModel>(context);

    final animation = Tween<double>(
      begin: 0,
      end: -120,
    ).animate(controller);

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

    if (!bnbVM.displayBottomNavBar) {
      controller.forward();
    } else {
      if (controller.isCompleted) {
        controller.reverse();
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Positioned(
                bottom: animation.value,
                left: 0,
                right: 0,
                child: CustomNavBar(
                  navigationShell: navigationShell,
                  labels: labels,
                  icons: icons,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
