// TODO : Use color from the themeprovider

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kucc_app/models/model/routine_data.dart';
import 'package:kucc_app/viewmodels/routine_viewmodel.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:kucc_app/views/pages/event_detail/components/event_button.dart';
import 'package:kucc_app/views/pages/routine/components/routine_faculty_and_batch_button.dart';
import 'package:kucc_app/views/pages/routine/components/routine_faculty_and_batch_dropdown.dart';
import 'package:kucc_app/views/pages/routine/components/routine_timeline.dart';
import 'package:kucc_app/views/pages/routine/components/routine_week_slider.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:timelines/timelines.dart';

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
                      Padding(
                          padding: const EdgeInsets.all(16), child: RoutineFacultyBatchDropDown()),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: RoutineFacultyBatchDropDown()),
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
