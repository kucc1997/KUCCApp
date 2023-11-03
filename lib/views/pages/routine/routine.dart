// TODO : Use color from the themeprovider

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kucc_app/views/components/app_bar.dart';
import 'package:kucc_app/views/pages/routine/components/routine_timeline.dart';
import 'package:kucc_app/views/pages/routine/components/routine_week_slider.dart';
import 'package:kucc_app/views/pages/routine/components/routine_faculty_and_batch_input.dart';

class Routine extends HookWidget {
  const Routine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E4F3),
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
