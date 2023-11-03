// TODO : Use color from the themeprovider

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/models/model/routine_data.dart';
import 'package:kucc_app/viewmodels/routine_viewmodel.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:kucc_app/views/pages/event_detail/components/event_button.dart';
import 'package:kucc_app/views/pages/routine/components/routine_timeline.dart';
import 'package:kucc_app/views/pages/routine/components/routine_week_slider.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:timelines/timelines.dart';

class RoutineFacultyBatchButton extends HookWidget {
  const RoutineFacultyBatchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(milliseconds: 0));
    final animation = useAnimation(controller);
    final primaryColor = useState(Colors.white);
    final textColor = useState(const Color(0xFF394078));
    // Create an OverlayEntry variable to hold the dropdown widget
    OverlayEntry? overlayEntry;
    void showDropDown() {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;
      final offset = renderBox.localToGlobal(Offset(0.0, size.height));

      overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            top: offset.dy,
            width: size.width,
            left: offset.dx,
            child: Text("alsjdfsalfjasljflsjfsaljfaj"),
          );
        },
      );

      Overlay.of(context)!.insert(overlayEntry!);
    }

    void hideDropdown() {
      overlayEntry?.remove();
      overlayEntry = null;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        hideDropdown(); // Close the dropdown when there's an outside click
      },
      child: Material(
        color: Colors.transparent,
        elevation: 1,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          onTap: () {
            //showDropDown();
            if (controller.isCompleted) {
              primaryColor.value = Color(0xFF394078);
              textColor.value = Colors.white;
              controller.reverse();
            } else {
              textColor.value = Color(0xFF394078);
              primaryColor.value = Colors.white;
              controller.forward();
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: primaryColor.value,
            ),
            width: 300,
            height: 60,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CS - 2021",
                  style: GoogleFonts.manrope(
                      color: textColor.value, fontSize: 24, fontWeight: FontWeight.w600),
                ),
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002) // Perspective effect
                        ..rotateX(animation * 3.14), // Rotate on the X-axis
                      child: Icon(Icons.keyboard_arrow_up, size: 28, color: textColor.value),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoutineFacultyBatchInput extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [Text("alfjsalfjdsalfjdjlafjs")]));
  }
}

class Routine extends HookWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    RoutineViewModel rVM = Provider.of(context);

    useEffect(() {}, []);
    return Scaffold(
      backgroundColor: Color(0xFFE2E4F3),
      body: Column(
        children: [
          KUCCAppBar(),
          const Padding(padding: EdgeInsets.all(20)),
          const RoutineFacultyBatchButton(),
          RoutineFacultyBatchInput(),
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: const RoutineWeekSlider(),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView(
                children: [
                  RoutineTimeline(),
                ],
                //),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
