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
  final void Function() onClick;

  const RoutineFacultyBatchButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(milliseconds: 80));
    final animation = useAnimation(controller);
    final isButtonActive = useState(false);
    final themeData = Theme.of(context);

    void onTap() {
      isButtonActive.value = !isButtonActive.value;
      onClick();
      if (isButtonActive.value) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: isButtonActive.value
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onPrimary,
            ),
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CS - 2021",
                  style: GoogleFonts.manrope(
                      color: isButtonActive.value
                          ? themeData.colorScheme.onPrimary
                          : themeData.colorScheme.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002) // Perspective effect
                        ..rotateX(animation * 3.14), // Rotate on the X-axis
                      child: Icon(Icons.keyboard_arrow_down,
                          size: 26,
                          color: isButtonActive.value
                              ? themeData.colorScheme.onPrimary
                              : themeData.colorScheme.primary),
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
    final themeData = Theme.of(context);
    final controller = useAnimationController(duration: const Duration(milliseconds: 80));
    final animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller);
    final isButtonActive = useState(false);

    void onClick() {
      if (isButtonActive.value) {
        controller.reverse();
      } else {
        controller.forward();
      }
      isButtonActive.value = !isButtonActive.value;
    }

    return Column(
      children: [
        RoutineFacultyBatchButton(
          onClick: onClick,
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: SizeTransition(
                sizeFactor: animation,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.colorScheme.onPrimary,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          children: [
                            Text(
                              "Please choose your faculty",
                              style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text("and semester to view class",
                                style:
                                    GoogleFonts.manrope(fontWeight: FontWeight.w500, fontSize: 16)),
                            Text("routine",
                                style:
                                    GoogleFonts.manrope(fontWeight: FontWeight.w500, fontSize: 16)),
                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(16), child: KUCCAttacheDropDownMenu()),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: KUCCAttacheDropDownMenu()),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class KUCCAttacheDropDownMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          onTap: () {
            //showDropDown();
          },
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Choose your faculty",
                    style: GoogleFonts.manrope(fontWeight: FontWeight.w500, fontSize: 16)),
                const Icon(Icons.keyboard_arrow_down, size: 28),
              ],
            ),
          )),
    );
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
          const KUCCAppBar(),
          const Padding(padding: EdgeInsets.all(20)),
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
